resource "azurerm_app_service_plan" "aspname" {
  name                = var.asp_name
  location            = var.rg_name
  resource_group_name = var.rg_location
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}
resource "azurerm_app_service" "asname" {
  name                = var.as_name
  location            = var.rg_name
  resource_group_name = var.rg_location
  app_service_plan_id = azurerm_app_service_plan.aspname.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
