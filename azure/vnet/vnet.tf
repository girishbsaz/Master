#----------------------------
# Pre-existing Resource Group
#----------------------------

data "azurerm_resource_group" "az_resource_group" {
  count = var.create_resource_group ? 0 : 1
  name  = var.az_resource_group_name
}

#---------------------------------------------
# Resource Group creation - Default is "false"
#---------------------------------------------

resource "azurerm_resource_group" "az_resource_group" {
  count    = var.create_resource_group ? 1 : 0
  name     = "rg-${local.project_envionment_infix}-${var.az_resource_group_sequence}"
  location = var.location

  tags = merge(
    local.common_tags,
    {
      Name        = "rg-${local.project_envionment_infix}-${var.az_resource_group_sequence}"
      Description = "A Resource Group in the ${var.location}."
    }
  )
}

#----------------------------------
# VNET Creation - Default is "true"
#----------------------------------

resource "azurerm_virtual_network" "az_virtual_network" {
  name                = "vnet-${var.project}-${local.environment_location_infix}-${var.az_vnet_sequence}"
  resource_group_name = local.resource_group_name
  location            = var.location
  address_space       = var.az_vnet_cidr
  dns_servers         = var.az_dns_servers

  dynamic "ddos_protection_plan" {

    for_each = var.enable_ddos_protection_plan == true ? range(1) : range(0)

    content {

      id = var.ddos_protection_plan_id

      enable = var.enable_ddos_protection_plan

    }

  }

  tags = merge(
    local.common_tags,
    {
      Name        = "vnet-${var.project}-${local.environment_location_infix}-${var.az_vnet_sequence}",
      Description = "A Virtual network in the ${local.resource_group_name}."
    }
  )
}
