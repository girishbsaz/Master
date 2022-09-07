# #############################################################################
# # OUTPUTS Synapse Workspace
# #############################################################################

output "id" {
  description = "The ID of the synapse workspace."
  value       = azurerm_synapse_workspace.syn_ws.id
}

output "connectivity_endpoints" {
  description = "A list of Connectivity endpoints for this Synapse Workspace."
  value       = azurerm_synapse_workspace.syn_ws.connectivity_endpoints
}

output "managed_resource_group_name" {
  description = "Workspace managed resource group."
  value       = azurerm_synapse_workspace.syn_ws.managed_resource_group_name
}

output "identity" {
  description = "An identity block which contains the Managed Service Identity information for this Synapse Workspace. - type - The Identity Type for the Service Principal associated with the Managed Service Identity of this Synapse Workspace. principal_id - The Principal ID for the Service Principal associated with the Managed Service Identity of this Synapse Workspace. tenant_id - The Tenant ID for the Service Principal associated with the Managed Service Identity of this Synapse Workspace."
  value       = azurerm_synapse_workspace.syn_ws.identity
}

output "sql_pool" {
  description = "SQL pool object"
  value       = azurerm_synapse_sql_pool.sql_pool.id
}
