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

    client_id         = ${env.ARM_CLIENT_ID}
    client_secret     = ${env.ARM_CLIENT_SECRET}
    subscription_id   = ${env.ARM_SUBSCRIPTION_ID}
    tenant_id         = ${env.ARM_TENANT_ID}
}


# Your code goes here

resource "random_pet" "rg-name" {
    prefix    = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
    name      = random_pet.rg-name.id
    location  = var.resource_group_location
}