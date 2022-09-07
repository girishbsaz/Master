![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

# Azure Synapse Analytics

This module is used to create a synapse workspace, a dedicated synapse SQL Pools and a private endpoint. 

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azurerm_private_endpoint"></a> [azurerm\_private\_endpoint](#module\_azurerm\_private\_endpoint) | ../privateendpoints | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.keyvault_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_monitor_diagnostic_setting.test](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_resource_group.az_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_storage_account.syn_storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.storage_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_data_lake_gen2_filesystem.syn_adls](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_data_lake_gen2_filesystem) | resource |
| [azurerm_synapse_sql_pool.sql_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_sql_pool) | resource |
| [azurerm_synapse_sql_pool_extended_auditing_policy.test](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_sql_pool_extended_auditing_policy) | resource |
| [azurerm_synapse_sql_pool_security_alert_policy.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_sql_pool_security_alert_policy) | resource |
| [azurerm_synapse_sql_pool_vulnerability_assessment.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_sql_pool_vulnerability_assessment) | resource |
| [azurerm_synapse_workspace.syn_ws](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace) | resource |
| [azurerm_synapse_workspace_extended_auditing_policy.syn_auditing_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace_extended_auditing_policy) | resource |
| [azurerm_synapse_workspace_security_alert_policy.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace_security_alert_policy) | resource |
| [azurerm_synapse_workspace_sql_aad_admin.sql_aad_admin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace_sql_aad_admin) | resource |
| [azurerm_synapse_workspace_vulnerability_assessment.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/synapse_workspace_vulnerability_assessment) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_resource_group.az_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.key_vault_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Azure_AD_Authentication_User_Login_Name"></a> [Azure\_AD\_Authentication\_User\_Login\_Name](#input\_Azure\_AD\_Authentication\_User\_Login\_Name) | A valid Azure AD user in the customer tenant to be Azure AD administrator | `string` | n/a | yes |
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | Specify the version of storage blob | `string` | n/a | yes |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | Replication type synapse storage account r | `string` | n/a | yes |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | account tier of synapse storage | `string` | n/a | yes |
| <a name="input_adls_name"></a> [adls\_name](#input\_adls\_name) | Is the Data Factory visible to the public network? | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | The administrator password of the Azure SQL Server | `string` | `null` | no |
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | `""` | no |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_confidentiality"></a> [confidentiality](#input\_confidentiality) | Is the Data Factory visible to the public network? | `string` | n/a | yes |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | Is the Data Factory visible to the public network? | `string` | n/a | yes |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for Virtual Network resource. | `bool` | `false` | no |
| <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name) | The name of the diagnostic setting. | `string` | `""` | no |
| <a name="input_disabled_alerts"></a> [disabled\_alerts](#input\_disabled\_alerts) | Specifies an array of alerts that are disabled. Allowed values are: Sql\_Injection, Sql\_Injection\_Vulnerability, Access\_Anomaly, Data\_Exfiltration, Unsafe\_Action. | `list(any)` | `[]` | no |
| <a name="input_email_addresses_for_alerts"></a> [email\_addresses\_for\_alerts](#input\_email\_addresses\_for\_alerts) | A list of email addresses which alerts should be sent to. | `list(any)` | `[]` | no |
| <a name="input_enable_threat_detection_policy"></a> [enable\_threat\_detection\_policy](#input\_enable\_threat\_detection\_policy) | Threat detection policy configuration for MySQL Server Security Alerts Policy | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | Eventhub authorization rule id | `string` | `""` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | Specifies the name of Eventhub | `string` | `""` | no |
| <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled) | hierarchical namespace of storage blob | `string` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Provide the key vault name present in the infrastructure with service principal's read access of key vault | `string` | `""` | no |
| <a name="input_key_vault_resource_group_name"></a> [key\_vault\_resource\_group\_name](#input\_key\_vault\_resource\_group\_name) | Key Vault resource group name | `string` | `""` | no |
| <a name="input_keyvault_id"></a> [keyvault\_id](#input\_keyvault\_id) | Is the Data Factory visible to the public network? | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the resource | `string` | n/a | yes |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | Specifies the number of days to keep in the Threat Detection audit logs | `string` | `"30"` | no |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources to be provisioned | `string` | n/a | yes |
| <a name="input_pe_name"></a> [pe\_name](#input\_pe\_name) | Whether to create resource group and use it for Virtual Network resource. | `string` | n/a | yes |
| <a name="input_pe_resource_group"></a> [pe\_resource\_group](#input\_pe\_resource\_group) | Is the Data Factory visible to the public network? | `string` | n/a | yes |
| <a name="input_pe_subnet"></a> [pe\_subnet](#input\_pe\_subnet) | Whether to create resource group and use it for Virtual Network resource. | `string` | n/a | yes |
| <a name="input_pe_subnet_name"></a> [pe\_subnet\_name](#input\_pe\_subnet\_name) | Is the Data Factory to be deployed in a managed virtual network | `string` | n/a | yes |
| <a name="input_pe_vnet_name"></a> [pe\_vnet\_name](#input\_pe\_vnet\_name) | Is the Data Factory visible to the public network? | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project for which the resources are provisioned | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Whether public network access is allowed for the Cognitive Account. | `string` | `"false"` | no |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | Specifies the number of days to keep in the Threat Detection audit logs | `string` | `"20"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Is the Data Factory to be deployed in a managed virtual network | `string` | n/a | yes |
| <a name="input_sql_admin_user"></a> [sql\_admin\_user](#input\_sql\_admin\_user) | Is the Data Factory to be deployed in a managed virtual network | `string` | n/a | yes |
| <a name="input_syn_sql_pool_name"></a> [syn\_sql\_pool\_name](#input\_syn\_sql\_pool\_name) | Whether to create resource group and use it for Virtual Network resource. | `string` | n/a | yes |
| <a name="input_tag_Confidentiality"></a> [tag\_Confidentiality](#input\_tag\_Confidentiality) | Specifies the Confidentiality details | `string` | n/a | yes |
| <a name="input_technical_contact"></a> [technical\_contact](#input\_technical\_contact) | The contact of the resources to be provisioned | `string` | n/a | yes |
| <a name="input_threat_detection_audit_logs_retention_days"></a> [threat\_detection\_audit\_logs\_retention\_days](#input\_threat\_detection\_audit\_logs\_retention\_days) | Specifies the number of days to keep in the Threat Detection audit logs. | `number` | n/a | yes |
| <a name="input_transparent_data_encryption"></a> [transparent\_data\_encryption](#input\_transparent\_data\_encryption) | (Optional) Whether public network access is allowed for the Cognitive Account. | `string` | `"true"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_connectivity_endpoints"></a> [connectivity\_endpoints](#output\_connectivity\_endpoints) | A list of Connectivity endpoints for this Synapse Workspace. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the synapse workspace. |
| <a name="output_identity"></a> [identity](#output\_identity) | An identity block which contains the Managed Service Identity information for this Synapse Workspace. - type - The Identity Type for the Service Principal associated with the Managed Service Identity of this Synapse Workspace. principal\_id - The Principal ID for the Service Principal associated with the Managed Service Identity of this Synapse Workspace. tenant\_id - The Tenant ID for the Service Principal associated with the Managed Service Identity of this Synapse Workspace. |
| <a name="output_managed_resource_group_name"></a> [managed\_resource\_group\_name](#output\_managed\_resource\_group\_name) | Workspace managed resource group. |
| <a name="output_sql_pool"></a> [sql\_pool](#output\_sql\_pool) | SQL pool object |
