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