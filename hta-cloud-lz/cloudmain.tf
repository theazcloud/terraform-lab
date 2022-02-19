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

variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "ARM_SUBSCRIPTION_ID" {}
variable "ARM_TENANT_ID" {}
provider "azurerm" {
  features {}
      client_id       = "${var.ARM_CLIENT_ID}"
      client_secret   = "${var.ARM_CLIENT_SECRET}"
      subscription_id = "${var.ARM_SUBSCRIPTION_ID}"
      tenant_id       = "${var.ARM_TENANT_ID}"
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

resource "azurerm_resource_group" "tf_cloud_rg" {
  name     = "tf_cloud_rg"
  location = "uksouth"
}