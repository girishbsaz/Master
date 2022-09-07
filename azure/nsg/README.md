![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

# Azure Network Security Group
A network security group contains security rules that allow or deny inbound network traffic to, or outbound network traffic from, several types of Azure resources.

> The module creates:
> - Network Security Group
> - Dynamic Inbound Rules
> - Dynamic Outbound Rules

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.90.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.az_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_nsg_sequence"></a> [az\_nsg\_sequence](#input\_az\_nsg\_sequence) | The suffix sequence for the NSG to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented. | `string` | n/a | yes |
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_default_network_security_group_inbound"></a> [default\_network\_security\_group\_inbound](#input\_default\_network\_security\_group\_inbound) | The default inbound security rules | `list` | `sensitive` | no |
| <a name="input_default_network_security_group_outbound"></a> [default\_network\_security\_group\_outbound](#input\_default\_network\_security\_group\_outbound) | n/a | `list` |The default outbound security rules | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_technical_contact"></a> [technical\_contact](#input\_technical\_contact) | The technical contact for the resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_nsg_id_output"></a> [az\_nsg\_id\_output](#output\_az\_nsg\_id\_output) | ID of new Network Security Group created. |
| <a name="output_az_nsg_name_output"></a> [az\_nsg\_name\_output](#output\_az\_nsg\_name\_output) | Name of new Network Security Group created. |
