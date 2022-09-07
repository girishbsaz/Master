data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}
data "azurerm_client_config" "current" {
}
resource "null_resource" "test" {
  for_each = var.private_endpoints
  provisioner "local-exec" {
    command = "az network vnet subnet update --name ${each.value["subnet_name"]} --resource-group ${each.value["networking_resource_group"]} --vnet-name ${each.value["vnet_name"]} --subscription ${data.azurerm_client_config.current.subscription_id} --disable-private-endpoint-network-policies true"
  }
  triggers = {
    subnet_name = each.value["subnet_name"]
  }
}

data "azurerm_private_dns_zone" "dns_zone" {
  for_each            = local.pe_integrated_zone
  name                = each.value.dns_zone
  resource_group_name = var.resource_group_name
}

# -
# - Private Endpoint
# -
resource "azurerm_private_endpoint" "private_endpoint" {
  for_each            = var.private_endpoints
  name                = each.value["name"]
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = var.resource_group_name
  subnet_id           = each.value["subnet_id"]
  private_service_connection {
    name                           = "${each.value["name"]}-connection"
    private_connection_resource_id = each.value["private_connection_address_id"]
    is_manual_connection           = coalesce(lookup(each.value, "approval_required"), false)
    subresource_names              = lookup(each.value, "group_ids", null)
    request_message                = coalesce(lookup(each.value, "approval_required"), false) == true ? coalesce(lookup(each.value, "approval_message"), var.approval_message) : null
  }
  dynamic "private_dns_zone_group" {
    for_each = lookup(each.value, "dns_zone_names", null) != null ? [1] : []
    content {
      name                 = each.value["dns_zone_group_name"]
      private_dns_zone_ids = lookup(local.map_of_dns_zones, each.key)
    }
  }

  tags = merge(local.common_tags, {
    name        = "${each.value["name"]}"
    Description = "Private endpoints created for ${var.project}."
  })

  depends_on = [null_resource.test]
}
