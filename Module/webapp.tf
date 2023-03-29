
resource "azurerm_app_service" "asname" {
  name                = var.as_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  app_service_plan_id = var.asp_name

  site_config {
    always_on          = true
   ftps_state          = "FtpsOnly"
   http2_enabled       = true
   linux_fx_version    = "DOCKER | ${var.image_name}"
}
