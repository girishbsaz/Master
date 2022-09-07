#--------------------------------
# Vnet Resource Group Name Output
#--------------------------------

output "az_vnet_resource_group_name_output" {
  description = "Name of Virtual Network's Resource Group"
  value       = azurerm_virtual_network.az_virtual_network.resource_group_name
}

#--------------------------------
# Vnet Resource Group ID Output
#--------------------------------

output "az_vnet_resource_group_id_output" {
  description = "ID of Virtual Network's Resource Group"
  value       = (var.create_resource_group ? azurerm_resource_group.az_resource_group[0].id : data.azurerm_resource_group.az_resource_group[0].id)
}

#------------------------------
# New Virtual Network Name Output
#------------------------------

output "az_virtual_network_name_output" {
  description = "ID of new Virtual Network created"
  value       = azurerm_virtual_network.az_virtual_network.name
}

#--------------------------------
# New Virtual Network ID Output
#--------------------------------

output "az_virtual_network_id_output" {
  description = "Name of new Virtual Network created"
  value       = azurerm_virtual_network.az_virtual_network.id
}

