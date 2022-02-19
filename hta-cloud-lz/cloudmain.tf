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

  client_id       = TFVAR_client_id
  client_secret   = TFVAR_client_secret
  subscription_id = TFVAR_subscription_id
  tenant_id       = TFVAR_tenant_id
}

data "azurerm_client_config" "core" {}