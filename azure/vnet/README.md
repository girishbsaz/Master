![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

# Azure Virtual Network Module
Azure Virtual Network (VNet) is the fundamental building block for your private network in Azure.
This Terraform module deploys a Virtual Network in Azure with a new resource group or in an existing resource group.

> Types of resources created:
> - [Virtual Network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)
> - [Resource Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) (optional)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.90.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.az_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_network.az_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.az_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_dns_servers"></a> [az\_dns\_servers](#input\_az\_dns\_servers) | List of IP addresses of DNS servers | `list(string)` | n/a | yes |
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | `""` | no |
| <a name="input_az_resource_group_sequence"></a> [az\_resource\_group\_sequence](#input\_az\_resource\_group\_sequence) | The suffix sequence for the Resource Group if ceated. The sequence number should always be checked from the Azure portal and incremented/decremented. | `string` | `""` | no |
| <a name="input_az_vnet_cidr"></a> [az\_vnet\_cidr](#input\_az\_vnet\_cidr) | The CIDR range of Virtual Network that should be created | `list(string)` | n/a | yes |
| <a name="input_az_vnet_sequence"></a> [az\_vnet\_sequence](#input\_az\_vnet\_sequence) | The suffix sequence for the Vnet to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented. | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for Virtual Network resource. | `bool` | `false` | no |
| <a name="input_ddos_protection_plan_id"></a> [ddos\_protection\_plan\_id](#input\_ddos\_protection\_plan\_id) | DDOS Protection Plan ID | `string` | n/a | yes |
| <a name="input_enable_ddos_protection_plan"></a> [enable\_ddos\_protection\_plan](#input\_enable\_ddos\_protection\_plan) | Should DDOS Protection Plan be enabled? | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_location_abbreviation"></a> [location\_abbreviation](#input\_location\_abbreviation) | The abbreviation of Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources to be provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_technical_contact"></a> [technical\_contact](#input\_technical\_contact) | tag technical contact | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_virtual_network_id_output"></a> [az\_virtual\_network\_id\_output](#output\_az\_virtual\_network\_id\_output) | Name of new Virtual Network created |
| <a name="output_az_virtual_network_name_output"></a> [az\_virtual\_network\_name\_output](#output\_az\_virtual\_network\_name\_output) | ID of new Virtual Network created |
| <a name="output_az_vnet_resource_group_id_output"></a> [az\_vnet\_resource\_group\_id\_output](#output\_az\_vnet\_resource\_group\_id\_output) | ID of Virtual Network's Resource Group |
| <a name="output_az_vnet_resource_group_name_output"></a> [az\_vnet\_resource\_group\_name\_output](#output\_az\_vnet\_resource\_group\_name\_output) | Name of Virtual Network's Resource Group |
