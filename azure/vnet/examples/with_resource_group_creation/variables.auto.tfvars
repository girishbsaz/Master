environment                = "dev"
project                    = "example"
owner                      = "example@mail.ae"
business_unit              = "BU"
operational_company        = "OpCo"
location                   = "uaenorth"
technical_contact          = "example@mail.ae"
create_resource_group      = true
az_resource_group_sequence = "009"

az_vnet_cidr                = ["10.0.0.0/16", "10.1.0.0/16"]
az_dns_servers              = ["10.0.0.1", "10.0.0.2"]
az_vnet_sequence            = "001"
location_abbreviation       = "un"
enable_ddos_protection_plan = true
ddos_protection_plan_id     = "/subscriptions/xxxxxxxxxxxxxx/resourceGroups/rg-example-dev-009/providers/Microsoft.Network/DDoSProtectionPlans/ddos_rg"

