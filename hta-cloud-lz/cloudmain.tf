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

data "azurerm_billing_mca_account_scope" "demo" {
  billing_account_name =  TF_VAR_BILLING_ACCOUNT_NAME
  billing_profile_name =  TF_VAR_BILLING_PROFILE_NAME
  invoice_section_name =  TF_VAR_INVOICE_SECTION_NAME
}