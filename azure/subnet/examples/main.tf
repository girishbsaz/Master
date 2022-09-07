terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.90.0"
    }
  }
  required_version = ">= 1.0.9"
}

provider "azurerm" {
  features {}
}

module "az_subnet" {
  source                 = "../"
  location               = var.location
  environment            = var.environment
  location_abbreviation  = var.location_abbreviation
  az_resource_group_name = var.az_resource_group_name
  az_subnet_sequence     = var.az_subnet_sequence
  project                = var.project
  az_subnet_cidr         = var.az_subnet_cidr
  az_nsg_id              = var.az_nsg_id
  az_route_table_id      = var.az_route_table_id
  az_vnet_name           = var.az_vnet_name
}
