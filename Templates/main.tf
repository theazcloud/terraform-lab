terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = ""
  client_secret   = ""
  subscription_id = ""
  tenant_id       = ""
}


# Your code goes here
data "azurerm_billing_mca_account_scope" "demo" {
  billing_account_name =  ARM_BILLING_ACCOUNT_NAME
  billing_profile_name =  ARM_BILLING_PROFILE_NAME
  invoice_section_name =  ARM_INVOICE_SECTION_NAME
}

resource "azurerm_subscription" "demo" {
  subscription_name = "ptdemo account"
  billing_scope_id  = data.azurerm_billing_mca_account_scope.demo.id
}

resource "azurerm_subscription" "example" {
  alias             = "ptdem"
  subscription_name = "ptdemo account"
  subscription_id   = demo.id
}