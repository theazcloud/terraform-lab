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


# Your code goes here

resource "azurerm_resource_group" "resource_groups_hub" {

  name     = "hub-core-sec-rsg"
  location = var.resource_group_location
}

resource "azurerm_resource_group" "resource_groups_sec" {

  name     = "hub-operations-rsg"
  location = var.resource_group_location

}