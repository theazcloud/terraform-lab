terraform {
    required_providers {
        azurerm = {
        source = "hashicorp/azurerm"
        version = "~>2.0"
        }
    }
}

provider "azurerm" {
    features {}

    client_id         = ""
    client_secret     = ""
    subscription_id   = ""
    tenant_id         = ""
}


# Your code goes here

resource "random_pet" "rg-name" {
    prefix    = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
    name      = random_pet.rg-name.id
    location  = var.resource_group_location
}