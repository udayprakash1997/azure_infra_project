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
resource "azurerm_linux_web_app" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_app_service_plan.example.id

  site_config {}
}
