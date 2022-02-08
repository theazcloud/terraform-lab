terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"

    }
  }
}

provider "azurerm" {

      client_id       = ""
      client_secret   = ""
      subscription_id = ""
      tenant_id       = ""
      features {}
}

# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

data "azurerm_client_config" "core" {}

# Use variables to customize the deployment
variable "root_id" {
  type    = string
  default = "es"
}

variable "root_name" {
  type    = string
  default = "Enterprise-Scale"
}

# Declare the Terraform Module for Cloud Adoption Framework
# Enterprise-scale and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = ">= 1.0.0"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

}

variable "billing_account_name" {}

variable "billing_profile_name" {}

variable "invoice_section_name" {}

data "azurerm_billing_mca_account_scope" "demo" {
  billing_account_name =  "${var.billing_account_name}"
  billing_profile_name =  "${var.billing_profile_name}"
  invoice_section_name =  "${var.invoice_section_name}"
}

resource "azurerm_subscription" "sandbox_sub" {
  subscription_name = "es sandboxes"
  depends_on = [
    module.enterprise_scale]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.demo.id

}

resource "azurerm_subscription" "mgmt_sub" {
  subscription_name = "es management"
  depends_on = [
    module.enterprise_scale]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.demo.id
}

resource "azurerm_subscription" "ident_sub" {
  subscription_name = "es identity"
  depends_on = [
    module.enterprise_scale]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.demo.id
}

resource "azurerm_subscription" "connect_sub" {
  subscription_name = "es connectivity"
  depends_on = [
    module.enterprise_scale]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.demo.id
}

resource "azurerm_subscription" "lz_sub" {
  subscription_name = "es landing-zone"
  depends_on = [
    module.enterprise_scale]
  billing_scope_id  = data.azurerm_billing_mca_account_scope.demo.id
}

data "azurerm_management_group" "sandbox_mg"{
  name = "es-sandboxes"
  depends_on = [
    module.enterprise_scale
  ]
}

data "azurerm_management_group" "mgmt_mg"{
  name = "es-management"
  depends_on = [
    module.enterprise_scale
  ]
}

data "azurerm_management_group" "ident_mg"{
  name = "es-identity"
  depends_on = [
    module.enterprise_scale
  ]
}

data "azurerm_management_group" "connect_mg"{
  name = "es-connectivity"
  depends_on = [
    module.enterprise_scale
  ]
}

data "azurerm_management_group" "lz_mg"{
  name = "es-landing-zones"
  depends_on = [
    module.enterprise_scale
  ]
}

data "azurerm_subscription" "sandbox_sub_to_add"{
  subscription_id = azurerm_subscription.sandbox_sub.subscription_id
}
resource "azurerm_management_group_subscription_association" "updated_sandbox_mg" {
  management_group_id = data.azurerm_management_group.sandbox_mg.id
  subscription_id     = data.azurerm_subscription.sandbox_sub_to_add.id
}

data "azurerm_subscription" "mgmt_sub_to_add"{
  subscription_id = azurerm_subscription.mgmt_sub.subscription_id
}
resource "azurerm_management_group_subscription_association" "updated_management_mg" {
  management_group_id = data.azurerm_management_group.mgmt_mg.id
  subscription_id     = data.azurerm_subscription.mgmt_sub_to_add.id
}

data "azurerm_subscription" "ident_sub_to_add"{
  subscription_id = azurerm_subscription.ident_sub.subscription_id
}
resource "azurerm_management_group_subscription_association" "updated_identity_mg" {
  management_group_id = data.azurerm_management_group.ident_mg.id
  subscription_id     = data.azurerm_subscription.ident_sub_to_add.id
}

data "azurerm_subscription" "connect_sub_to_add"{
  subscription_id = azurerm_subscription.connect_sub.subscription_id
}
resource "azurerm_management_group_subscription_association" "updated_conectivity_mg" {
  management_group_id = data.azurerm_management_group.connect_mg.id
  subscription_id     = data.azurerm_subscription.connect_sub_to_add.id
}

data "azurerm_subscription" "lz_sub_to_add"{
  subscription_id = azurerm_subscription.lz_sub.subscription_id
}
resource "azurerm_management_group_subscription_association" "updated_landing-zone_mg" {
  management_group_id = data.azurerm_management_group.lz_mg.id
  subscription_id     = data.azurerm_subscription.lz_sub_to_add.id
}

provider "azurerm" {
  alias = "sandbox"
  subscription_id = azurerm_subscription.sandbox_sub.subscription_id
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {}
}

provider "azurerm" {
  alias = "mgmt"
  subscription_id = azurerm_subscription.mgmt_sub.subscription_id
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {}
}

provider "azurerm" {
  alias = "identity"
  subscription_id = azurerm_subscription.ident_sub.subscription_id
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {}
}

provider "azurerm" {
  alias = "connect"
  subscription_id = azurerm_subscription.connect_sub.subscription_id
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {}
}

provider "azurerm" {
  alias = "landing_zone"
  subscription_id = azurerm_subscription.lz_sub.subscription_id
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {}
}

resource "azurerm_resource_group" "sandbox" {
  name = var.resource_group_name[4]
  location = var.location
  provider = azurerm.sandbox
}

resource "azurerm_resource_group" "mgmt" {
  name = var.resource_group_name[3]
  location = var.location
  provider = azurerm.mgmt
}

resource "azurerm_resource_group" "identity" {
  name = var.resource_group_name[2]
  location = var.location
  provider = azurerm.identity
}

resource "azurerm_resource_group" "connect" {
  name = var.resource_group_name[1]
  location = var.location
  provider = azurerm.connect
}

resource "azurerm_resource_group" "landing_zone" {
  name = var.resource_group_name[0]
  location = var.location
  provider = azurerm.landing_zone
}