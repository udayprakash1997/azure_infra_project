resource "azurerm_app_service" "asname" {
  name                = var.as_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  app_service_plan_id = var.asp_name

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
