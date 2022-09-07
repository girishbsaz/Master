#-------------------
# Local declarations
#-------------------

locals {
  resource_group_name      = element(coalescelist(data.azurerm_resource_group.az_resource_group.*.name, azurerm_resource_group.az_resource_group.*.name, [""]), 0)
  project_envionment_infix = "${var.project}-${var.environment}"

  administrator_login_password = var.administrator_login_password == null ? random_password.password.result : var.administrator_login_password

  common_tags = {
    Environment      = var.environment
    Project          = var.project
    Owner            = var.owner
    BusinessUnit     = var.business_unit
    OpCo             = var.operational_company
    Confidentiality  = var.confidentiality
    TechnicalContact = var.technical_contact
  }
}
