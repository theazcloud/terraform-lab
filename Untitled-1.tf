
resource "azurerm_log_analytics_workspace" "lz_log" {
  name                = "lz-law"
  location            = azurerm_resource_group.mgmt.location
  resource_group_name = azurerm_resource_group.mgmt.name
  sku                 = "Free"
  retention_in_days   = 7
}