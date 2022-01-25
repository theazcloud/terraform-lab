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

resource "azurerm_management_group" "example_parent" {
  display_name = "Test_ParentGroup"

}
resource "azurerm_management_group" "example_child" {
  display_name               = "Test_ChildGroup"
  parent_management_group_id = azurerm_management_group.example_parent.id
}

resource "azurerm_management_group" "example_child2" {
  display_name               = "Test_ChildGroup_2"
  parent_management_group_id = azurerm_management_group.example_parent.id
}

resource "azurerm_management_group" "example_child3" {
  display_name               = "Test_ChildGroup_3"
  parent_management_group_id = azurerm_management_group.example_parent.id
}