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

variable "billing_account_name" {
  string = ""
}

variable "billing_profile_name" {
  string = ""
}

variable "invoice_section_name" {
  string = ""
}

data "azurerm_billing_mca_account_scope" "demo" {
  billing_account_name =  "${var.billing_account_name}"
  billing_profile_name =  "${var.billing_profile_name}"
  invoice_section_name =  "${var.invoice_section_name}"
}

resource "azurerm_subscription" "demo" {
  subscription_name = "ptdemo account"
  billing_scope_id  = data.azurerm_billing_mca_account_scope.demo.id
}