terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.59.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}

module "Private_endpoints" {
  source              = "../"
  resource_group_name = "test-sandy-rg"

  private_endpoints = {
    pe1 = {
      resource_name                 = "testsandy"         # Mysql Server name
      name                          = "testsandy-prod-pe" # Private Endpoint name <resource_name>-pe
      subnet_id                     = "/subscriptions/646497f2-cf94-40d9-9ea0-0bb44fcce127/resourceGroups/test-sandy-rg/providers/Microsoft.Network/virtualNetworks/vnet-test-pe-01/subnets/subnet-test-pe-01"
      subnet_name                   = "subnet-test-pe-01"
      vnet_name                     = "vnet-test-pe-01"
      networking_resource_group     = "test-sandy-rg"
      group_ids                     = ["mysqlserver"]
      approval_required             = false
      approval_message              = null
      dns_zone_names                = null
      dns_rg_name                   = null
      dns_zone_group_name           = null
      private_connection_address_id = "/subscriptions/646497f2-cf94-40d9-9ea0-0bb44fcce127/resourceGroups/test-sandy-rg/providers/Microsoft.DBforMySQL/servers/testsandy"
    }
    /*pe2 = {
      resource_name                 = "[__key_vault_name__]"
      name                          = "privateendpointkeyvault"
      subnet_id                     = "/subscriptions/[__subscription_id__]/resourceGroups/[__networking_resource_group_name__]/providers/Microsoft.Network/virtualNetworks/[__virtual_network_name__]/subnets/proxy"
      subnet_name                   = "[__subnet_name__]"
      vnet_name                     = "[__vnet_name__]"
      networking_resource_group     = "[__vnet_resource_group_name__]"
      group_ids                     = ["vault"]
      approval_required             = false
      approval_message              = null
      dns_zone_names                = null
      dns_rg_name                   = null
      dns_zone_group_name           = null
      private_connection_address_id = "/subscriptions/[__subscription_id__]/resourceGroups/[__resource_group_name__]/providers/Microsoft.KeyVault/vaults/[__key_vault_name__]"
    }
    pe3 = {
      resource_name                 = "[__automationaccount_name__]"
      name                          = "privateendpointautomationaccount"
      subnet_id                     = "/subscriptions/[__subscription_id__]/resourceGroups/[__networking_resource_group_name__]/providers/Microsoft.Network/virtualNetworks/[__virtual_network_name__]/subnets/proxy"
      subnet_name                   = "[__subnet_name__]"
      vnet_name                     = "[__vnet_name__]"
      networking_resource_group     = "[__vnet_resource_group_name__]"
      group_ids                     = ["DSCAndHybridWorker"]
      approval_required             = false
      approval_message              = null
      dns_zone_names                = ["privatelink.azure-automation.net"]
      dns_rg_name                   = null
      dns_zone_group_name           = "automationaccount"
      private_connection_address_id = "/subscriptions/[__subscription_id__]/resourceGroups/[__resource_group_name__]/providers/Microsoft.Automation/automationAccounts/[__automationaccount_name__]"
    },
    pe4 = {
      resource_name                 = "functionapp08252021c"
      name                          = "privateendpointfunctionapp"
      subnet_id                     = "/subscriptions/[__subscription_id__]/resourceGroups/[__networking_resource_group_name__]/providers/Microsoft.Network/virtualNetworks/[__virtual_network_name__]/subnets/proxy"
      subnet_name                   = "[__subnet_name__]"
      vnet_name                     = "[__vnet_name__]"
      networking_resource_group     = "[__vnet_resource_group_name__]"
      group_ids                     = ["sites"]
      approval_required             = false
      approval_message              = null
      dns_zone_names                = ["azurewebsites.net"]
      dns_rg_name                   = null
      dns_zone_group_name           = "functionappdns"
      private_connection_address_id = "/subscriptions/[__subscription_id__]/resourceGroups/[__resource_group_name__]/providers/Microsoft.Web/sites/functionapp08252021c"
    }*/
  }
  environment         = "dev"
  project             = "test"
  owner               = "Sandeep@example.com"
  business_unit       = "MAF"
  confidentiality     = "Sensitive"
  operational_company = "test"
  technical_contact   = "Sandeep@example.com"
}
