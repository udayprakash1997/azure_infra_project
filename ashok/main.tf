resource "azurerm_resource_group" "example" {
  name     = "foodalertresourcegroup12"
  location = "East US"
}
resource "azurerm_service_plan" "appserviceplan" {
  name                = "webapp-asp-foodalert-linux"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "B1"
}
