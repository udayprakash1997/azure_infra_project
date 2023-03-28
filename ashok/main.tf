resource "azurerm_resource_group" "example" {
  name     = "foodalertresourcegroup1200"
  location = "East US"
}
resource "azurerm_app_service_plan" "example" {
  name                = "ashokappserviceplan125"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "example" {
  name                = "foodalert-Ui5"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
