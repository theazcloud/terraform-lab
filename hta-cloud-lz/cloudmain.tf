terraform {

    cloud {
    organization = "PT-Terraform-Lab"
    workspaces {
      tags = ["training"]
    }
  }
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = ">=2.46.0"
        }
    }
}

provider "azurerm" {
  features {}

}

data "azurerm_client_config" "core" {}

variable  "ARM_BILLING_ACCOUNT_NAME" {}

variable "ARM_BILLING_PROFILE_NAME" {}

variable "ARM_INVOICE_SECTION_NAME" {}


data "azurerm_billing_mca_account_scope" "demo" {
  billing_account_name =  "${var.ARM_BILLING_ACCOUNT_NAME}"
  billing_profile_name =  "${var.ARM_BILLING_PROFILE_NAME}"
  invoice_section_name =  "${var.ARM_INVOICE_SECTION_NAME}"
}