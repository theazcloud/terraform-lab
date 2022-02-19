
resource "azurerm_log_analytics_workspace" "lz_log" {
  name                = "lz-law"
  location            = azurerm_resource_group.mgmt.location
  resource_group_name = azurerm_resource_group.mgmt.name
  sku                 = "Free"
  retention_in_days   = 7
}

resource "azurerm_storage_account" "example" {
  name                     = var.lz_storage_account_name
  resource_group_name      = azurerm_resource_group.lz.name
  location                 = azurerm_resource_group.lz.location
  provider                 = azurerm.lzone
  account_tier             = "Standard"
  account_replication_type = "LRS"
}