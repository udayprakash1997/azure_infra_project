resource "azurerm_app_service_plan" "aspname" {
  name                = var.asp_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}
data "azurerm_app_service_plan" "example" {
  existasp_name                = azurerm_app_service_plan.aspname.name
  resource_group_name = var.rg_name
}

#output "app_service_plan_id" {
 # value = data.azurerm_app_service_plan.example.id
#}
resource "azurerm_app_service" "asname" {
  name                = var.as_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.aspname.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
