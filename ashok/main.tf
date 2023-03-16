resource "azurerm_resource_group" "rg" {
  name     = "foodalertresourcegroup123"
  location = "East US"
}

resource "azurerm_app_service_plan" "example" {
  name                = "api-appserviceplan-pro"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
