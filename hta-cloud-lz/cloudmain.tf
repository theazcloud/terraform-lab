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