#---------------------------------------------
# Pre-existing Resource Group Name 
#---------------------------------------------
data "azurerm_resource_group" "az_resource_group" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.az_resource_group_name
}

#---------------------------------------------
# Resource Group creation - Default is "false"
#---------------------------------------------
resource "azurerm_resource_group" "az_resource_group" {
  count    = var.create_resource_group == true ? 1 : 0
  name     = var.az_resource_group_name
  location = var.location

  tags = merge(
    local.common_tags,
    {
      Name        = "${var.az_resource_group_name}"
      Description = "Resource group created for ${var.project}"
    }
  )
}

#---------------------------------------------
# Data source for Azure key vault 
#---------------------------------------------
data "azurerm_resource_group" "key_vault_rg" {
  name = var.key_vault_resource_group_name
}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.key_vault_rg.name
}

#---------------------------------------------
# Get the current user config
#---------------------------------------------
data "azurerm_client_config" "current" {}

#---------------------------------------------
# Storage account creation
#---------------------------------------------
resource "azurerm_storage_account" "syn_storage" {
  name                     = "sysstore${var.project}${var.environment}001"
  resource_group_name      = var.az_resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  is_hns_enabled           = var.is_hns_enabled

  tags = merge(
    local.common_tags,
    {
      Name = "sysstore${var.project}${var.environment}001",
      Description = "Storage account created for syn-${local.project_envionment_infix}-001."
    }
  )
  depends_on = [azurerm_resource_group.az_resource_group]
}

resource "azurerm_storage_data_lake_gen2_filesystem" "syn_adls" {
  name               = var.adls_name
  storage_account_id = azurerm_storage_account.syn_storage.id
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "vulnerabilitycontainer"
  storage_account_name  = azurerm_storage_account.syn_storage.name
  container_access_type = "private"
}

#---------------------------------------------
# Generate random password
#---------------------------------------------
resource "random_password" "password" {
  length           = 32
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  number           = true
  special          = true
  override_special = "!@$%*()-_=+[]{}:?"
}

#---------------------------------------------------
# Add random Password generated to Key Vault secrets
#---------------------------------------------------
resource "azurerm_key_vault_secret" "keyvault_secret" {
  count        = (var.key_vault_name != null) ? 1 : 0 
  name         = azurerm_synapse_workspace.syn_ws.name
  value        = local.administrator_login_password
  key_vault_id = data.azurerm_key_vault.key_vault.id
  depends_on   = [azurerm_synapse_workspace.syn_ws]
}

#----------------------------------------------------
# Synapse Workspace creation with additional features
#----------------------------------------------------
resource "azurerm_synapse_workspace" "syn_ws" {
  name                                 = "syn-${local.project_envionment_infix}-001"
  resource_group_name                  = var.az_resource_group_name
  location                             = var.location
  managed_virtual_network_enabled      = true
  public_network_access_enabled        = var.public_network_access_enabled
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.syn_adls.id
  sql_administrator_login              = var.sql_admin_user
  sql_administrator_login_password     = local.administrator_login_password

  tags = merge(
    local.common_tags,
    {
      Name        = "syn-${local.project_envionment_infix}-001",
      Description = "Synapse workspace created for ${var.project}."
    }
  )
}

resource "azurerm_synapse_workspace_sql_aad_admin" "sql_aad_admin" {
  synapse_workspace_id = azurerm_synapse_workspace.syn_ws.id
  login                = var.Azure_AD_Authentication_User_Login_Name
  object_id            = data.azurerm_client_config.current.tenant_id
  tenant_id            = data.azurerm_client_config.current.object_id
  depends_on           = [azurerm_synapse_workspace.syn_ws]
}

resource "azurerm_synapse_workspace_extended_auditing_policy" "syn_auditing_policy" {
  synapse_workspace_id                    = azurerm_synapse_workspace.syn_ws.id
  storage_endpoint                        = azurerm_storage_account.syn_storage.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.syn_storage.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = 6
}

resource "azurerm_synapse_workspace_security_alert_policy" "example" {
  synapse_workspace_id       = azurerm_synapse_workspace.syn_ws.id
  policy_state               = "Enabled"
  email_addresses            = var.email_addresses_for_alerts
  retention_days             = var.threat_detection_audit_logs_retention_days
  disabled_alerts            = var.disabled_alerts
  storage_endpoint           = azurerm_storage_account.syn_storage.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.syn_storage.primary_access_key
}

resource "azurerm_synapse_workspace_vulnerability_assessment" "example" {
  workspace_security_alert_policy_id = azurerm_synapse_workspace_security_alert_policy.example.id
  storage_container_path             = "${azurerm_storage_account.syn_storage.primary_blob_endpoint}${azurerm_storage_container.storage_container.name}/"
  storage_account_access_key         = azurerm_storage_account.syn_storage.primary_access_key

  recurring_scans {
    enabled                           = true
    email_subscription_admins_enabled = true
    emails = var.email_addresses_for_alerts
  }
}

#---------------------------------------------
# Synapse SQL Pool Creation
#---------------------------------------------
resource "azurerm_synapse_sql_pool" "sql_pool" {
  name                 = var.syn_sql_pool_name
  synapse_workspace_id = azurerm_synapse_workspace.syn_ws.id
  sku_name             = var.sku_name
  create_mode          = var.create_mode
  data_encrypted       = var.transparent_data_encryption

  tags = merge(
    local.common_tags,
    {
      Name        = "${var.syn_sql_pool_name}"
      Description = "Synapse sql pool created for syn-${local.project_envionment_infix}-001"
    }
  )
}

resource "azurerm_synapse_sql_pool_extended_auditing_policy" "test" {
  sql_pool_id            = azurerm_synapse_sql_pool.sql_pool.id
  log_monitoring_enabled = true
}

resource "azurerm_monitor_diagnostic_setting" "test" {
  name                           = var.diagnostic_setting_name 
  target_resource_id             = azurerm_synapse_sql_pool.sql_pool.id
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  eventhub_name                  = var.eventhub_name
  
  log {
    category = "SQLSecurityAuditEvents"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
  
  metric {
    category = "AllMetrics"
    retention_policy {
      enabled = false
    }
  }
  
  lifecycle {
    ignore_changes = [log, metric]
  }
}

resource "azurerm_synapse_sql_pool_security_alert_policy" "example" {
  sql_pool_id                = azurerm_synapse_sql_pool.sql_pool.id
  policy_state               = "Enabled"
  email_addresses            = var.email_addresses_for_alerts
  retention_days             = var.threat_detection_audit_logs_retention_days
  disabled_alerts            = var.disabled_alerts
  storage_endpoint           = azurerm_storage_account.syn_storage.primary_blob_endpoint
  storage_account_access_key = azurerm_storage_account.syn_storage.primary_access_key
}

resource "azurerm_synapse_sql_pool_vulnerability_assessment" "example" {
  sql_pool_security_alert_policy_id = azurerm_synapse_sql_pool_security_alert_policy.example.id
  storage_container_path            = "${azurerm_storage_account.syn_storage.primary_blob_endpoint}${azurerm_storage_container.storage_container.name}/"
  storage_account_access_key        = azurerm_storage_account.syn_storage.primary_access_key

  recurring_scans {
    enabled                           = true
    email_subscription_admins_enabled = true
    emails = var.email_addresses_for_alerts
  }
}

#---------------------------------------------
# Private endpoint for synapse workspace
#---------------------------------------------
module "azurerm_private_endpoint" {
  source              = "../privateendpoints"
  resource_group_name = var.az_resource_group_name


  private_endpoints = {
    pe1 = {
      resource_name                 = azurerm_synapse_workspace.syn_ws.name
      name                          = var.pe_name
      subnet_id                     = var.pe_subnet
      subnet_name                   = var.pe_subnet_name
      vnet_name                     = var.pe_vnet_name
      networking_resource_group     = var.pe_resource_group
      group_ids                     = ["Sql"]
      approval_required             = false
      approval_message              = null
      dns_zone_names                = null
      dns_rg_name                   = null
      dns_zone_group_name           = null
      private_connection_address_id = azurerm_synapse_workspace.syn_ws.id
    }
  }
  environment         = var.environment
  project             = var.project
  owner               = var.owner
  business_unit       = var.business_unit
  operational_company = var.operational_company
  confidentiality     = var.confidentiality
  technical_contact   = var.technical_contact
  depends_on = [azurerm_resource_group.az_resource_group]
}
