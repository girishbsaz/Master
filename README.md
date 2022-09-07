![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

# AWS & Azure Infrastructure as Code(IaC) with Terraform
Infrastructure as code (IaC) is the process of managing and provisioning computer data centers through machine-readable definition files, rather than physical hardware configuration or interactive configuration tools.

With IaC, configuration files are created that contain your infrastructure specifications, which makes it easier to edit and distribute configurations. It also ensures that you provision the same environment every time.

By codifying and documenting your configuration specifications, IaC aids configuration management and helps you to avoid undocumented, ad-hoc configuration changes.

Version control is an important part of IaC, and your configuration files should be under source control just like any other software source code file. 

Deploying your infrastructure as code also means that you can divide your infrastructure into modular components that can then be combined in different ways through automation.

Source: [What is Infrastructure as code? - Redhat](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-iac)

![iac](https://blog.stackpath.com/wp-content/uploads/2020/01/infrastructure-as-code.png)

## AWS IaC Terraform Modules
List of custom Terraform modules of the resources available in the AWS public cloud:
- AWS VPC module
- AWS Subnet module
- AWS Route Table module
- AWS Security Group module
- AWS NACL module
- AWS Flow logs Module
- AWS Cloudwatch module
- AWS Guardduty module
- AWS Security Account module
- AWS SNS module
- AWS Transit Gateway VPC Attachment module
- AWS Config module
- AWS Log Account module
- AWS Landing Zone module
- AWS Security Hub module

## Azure IaC Terraform Modules
List of custom Terraform modules of the resources available in the Azure public cloud:
- Azure app_role_assignment
- Azure appservice
- Azure azsqldb
- Azure compute
- Azure connectivity_subscription
- Azure cosmosdb
- Azure  data_factory
- Azure  ddos_protection_plan
- Azure diagnosticslogs
- Azure dns_zone
- Azure event_hub
- Azure key_vault
- Azure landing_zone
- Azure loadbalancer
- Azure management_subscription
- Azure mssql_vm
- Azure mysql
- Azure network_flow_log
- Azure nsg
- Azure policy_assignment
- Azure policy_definition
- Azure postgresqldb
- Azure privateendpoints
- Azure recovery_services_vault
- Azure resourcegroup
- Azure route_table
- Azure security_center
- Azure storageaccount
- Azure subnet
- Azure synapse
- Azure virtual_network_gateway
- Azure vm_backup
- Azure vnet

## Features
-------------------

AWS and Azure Modules are tested against the OPA policies which resides in `iac-pac` repository

## Future Enhancements
-------------------

None for now

## In Progress
-------------------

None for now
