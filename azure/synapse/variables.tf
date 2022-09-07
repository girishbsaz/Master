variable "create_resource_group" {
  description = "Whether to create resource group and use it for Virtual Network resource."
  type        = bool
  default     = false
}

variable "az_resource_group_name" {
  description = "A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created."
  type        = string
  default     = ""
}

variable "location" {
  description = "Location of the resource"
  type        = string
}

variable "public_network_access_enabled" {
  description = "(Optional) Whether public network access is allowed for the Cognitive Account."
  type        = string
  default     = "false"
}

variable "transparent_data_encryption" {
  description = "(Optional) Whether public network access is allowed for the Cognitive Account."
  type        = string
  default     = "true"
}

variable "account_tier" {
  description = "account tier of synapse storage"
  type        = string
}

variable "account_replication_type" {
  description = "Replication type synapse storage account r"
  type        = string
}

variable "account_kind" {
  description = "Specify the version of storage blob"
  type        = string
}

variable "is_hns_enabled" {
  description = "hierarchical namespace of storage blob"
  type        = string
}

variable "project" {
  description = "The project for which the resources are provisioned"
  type        = string
}

variable "environment" {
  description = "The environment used for all the resources in this provision.\nExpected values are: dev,prod,sandbox,UAT,test"
  type        = string
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
}

variable "owner" {
  description = "The owner of the resources to be provisioned"
  type        = string
}

variable "technical_contact" {
  description = "The contact of the resources to be provisioned"
  type        = string
}

variable "operational_company" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}

variable "confidentiality" {
  description = "Is the Data Factory visible to the public network?"
  type        = string
}

variable "adls_name" {
  description = "Is the Data Factory visible to the public network?"
  type        = string
}

variable "sql_admin_user" {
  description = "Is the Data Factory to be deployed in a managed virtual network"
  type        = string
}

variable "diagnostic_setting_name" {
  type        = string
  default     = ""
  description = "The name of the diagnostic setting."
}

variable "syn_sql_pool_name" {
  description = "Whether to create resource group and use it for Virtual Network resource."
  type        = string
}

variable "sku_name" {
  description = "Is the Data Factory to be deployed in a managed virtual network"
  type        = string
}

variable "create_mode" {
  description = "Is the Data Factory visible to the public network?"
  type        = string
}

variable "pe_name" {
  description = "Whether to create resource group and use it for Virtual Network resource."
  type        = string
}

variable "pe_subnet" {
  description = "Whether to create resource group and use it for Virtual Network resource."
  type        = string
}

variable "pe_subnet_name" {
  description = "Is the Data Factory to be deployed in a managed virtual network"
  type        = string
}

variable "pe_vnet_name" {
  description = "Is the Data Factory visible to the public network?"
  type        = string
}

variable "pe_resource_group" {
  description = "Is the Data Factory visible to the public network?"
  type        = string
}

variable "keyvault_id" {
  description = "Is the Data Factory visible to the public network?"
  type        = string
  default     = null
}

variable "enable_threat_detection_policy" {
  description = "Threat detection policy configuration for MySQL Server Security Alerts Policy"
  default     = true
}

variable "email_addresses_for_alerts" {
  description = "A list of email addresses which alerts should be sent to."
  type        = list(any)
  default     = []
}

variable "disabled_alerts" {
  description = "Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action."
  type        = list(any)
  default     = []
}

variable "log_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs"
  default     = "30"
}

variable "retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs"
  default     = "20"
}

variable "Azure_AD_Authentication_User_Login_Name" {
  type        = string
  description = "A valid Azure AD user in the customer tenant to be Azure AD administrator"
}

variable "threat_detection_audit_logs_retention_days" {
  type        = number
  description = "Specifies the number of days to keep in the Threat Detection audit logs."
}

variable "administrator_login_password" {
  type        = string
  description = "The administrator password of the Azure SQL Server"
  default     = null
}

variable "key_vault_resource_group_name" {
  description = "Key Vault resource group name"
  type        = string
  default     = ""
}

variable "key_vault_name" {
  description = "Provide the key vault name present in the infrastructure with service principal's read access of key vault"
  type        = string
  default     = ""
}

variable "eventhub_authorization_rule_id" {
  type        = string
  description = "Eventhub authorization rule id"
  default     = ""
}

variable "eventhub_name" {
  type        = string
  description = "Specifies the name of Eventhub"
  default     = ""
}
