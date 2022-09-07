environment            = "dev"
project                = "example"
owner                  = "example@mail.ae"
business_unit          = "BU"
operational_company    = "OpCo"
technical_contact      = "example@mail.ae"
location               = "uaenorth"
az_resource_group_name = "test-menna"

az_vnet_cidr                = ["10.0.0.0/16", "10.1.0.0/16"]
az_dns_servers              = ["10.0.0.1", "10.0.0.2"]
az_vnet_sequence            = "009"
location_abbreviation       = "un"
enable_ddos_protection_plan = true
ddos_protection_plan_id     = "/subscriptions/xxxxxxxxxxxxxxxxxxxx/resourceGroups/rg-example-dev-009/providers/Microsoft.Network/DDoSProtectionPlans/ddosplan"
