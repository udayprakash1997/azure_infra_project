resource "azurerm_resource_group" "rgname" {
  name     = var.rg_name
  location = var.rh_location
}
resource "azurerm_app_service_plan" "aspname" {
  name                = var.asp_name
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}
resource "azurerm_app_service" "asname" {
  name                = var.as_name
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name
  app_service_plan_id = azurerm_app_service_plan.aspname.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
