resource "azurerm_resource_group" "example" {
  name     = "foodalertresourcegroup12"
  location = "East US"
}
resource "azurerm_app_service_plan" "example" {
  name                = "ashokappserviceplan12"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}
