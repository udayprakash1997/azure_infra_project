resource "azurerm_resource_group" "rg" {
  name     = "foodalertresourcegroup123"
  location = "East US"
}

resource "azurerm_app_service_plan" "example" {
  name                = "api-appserviceplan-proashok"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}
