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

variable "billing_account_name" {}

variable "billing_profile_name" {}

variable "invoice_section_name" {}

data "azurerm_billing_mca_account_scope" "demo" {
  billing_account_name =  "${var.billing_account_name}"
  billing_profile_name =  "${var.billing_profile_name}"
  invoice_section_name =  "${var.invoice_section_name}"
}
