variable "resource_group_name" {
  type        = string
  description = "Resource Group name of private endpoint."
  default     = null
}

# -	
# - Private Endpoints
# -
variable "private_endpoints" {
  type = map(object({
    name                          = string
    subnet_id                     = string
    subnet_name                   = string
    vnet_name                     = string
    networking_resource_group     = string
    resource_name                 = string
    group_ids                     = list(string)
    approval_required             = bool
    approval_message              = string
    dns_zone_names                = list(string)
    dns_zone_group_name           = string
    dns_rg_name                   = string
    private_connection_address_id = string
  }))
  description = "Map containing Private Endpoint and Private DNS Zone details"
  default     = {}
}

variable "approval_message" {
  type        = string
  description = "A message passed to the owner of the remote resource when the private endpoint attempts to establish the connection to the remote resource"
  default     = "Please approve my private endpoint connection request"
}

variable "project" {
  description = "The project in which the resources are provisioned"
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

variable "operational_company" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}

variable "technical_contact" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}

variable "confidentiality" {
  type        = string
  description = "Private Endpoint tag confidentiality"
}
