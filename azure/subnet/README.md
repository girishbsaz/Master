![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

# Azure Subnet Module
A subnet is a range of IP addresses in the virtual network. 
This module creates: 
- As many subnets as we want by providing valid CIDR to the `az_subnet_cidr` as comma seperated values
- Associates the subnets created to a Route Table
- Associates the subnets created to a Network Security Group

## Requirements/Pre-requsites
- An existing Virtual Network
- An existing Route Table
- An existing Network Security Group

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.90.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.az_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.az_subnet_network_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.az_subnet_network_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_nsg_id"></a> [az\_nsg\_id](#input\_az\_nsg\_id) | The NSG's id to which the Subnet/s have to be associated. | `string` | n/a | yes |
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | n/a | yes |
| <a name="input_az_route_table_id"></a> [az\_route\_table\_id](#input\_az\_route\_table\_id) | The Route Table's id to which the Subnet/s have to be associated. | `string` | n/a | yes |
| <a name="input_az_subnet_cidr"></a> [az\_subnet\_cidr](#input\_az\_subnet\_cidr) | The CIDR range of the Subnet/s that should be created in the new Vnet.<br>  Enter comma separated values of Subnet/s CIDR if more than one Subnet is needed.<br>  example: 10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24 | `string` | n/a | yes |
| <a name="input_az_subnet_sequence"></a> [az\_subnet\_sequence](#input\_az\_subnet\_sequence) | The suffix sequence for the Subnet/s to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented. | `string` | n/a | yes |
| <a name="input_az_vnet_name"></a> [az\_vnet\_name](#input\_az\_vnet\_name) | The name of the virtual network to which to attach the subnet | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_location_abbreviation"></a> [location\_abbreviation](#input\_location\_abbreviation) | The abbreviation of Azure location where all resources in this provision should be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_subnet_id_output"></a> [az\_subnet\_id\_output](#output\_az\_subnet\_id\_output) | List of ID/s of new Subnet/s created. |
| <a name="output_az_subnet_name_output"></a> [az\_subnet\_name\_output](#output\_az\_subnet\_name\_output) | List Name/s of new Subnet/s created. |
