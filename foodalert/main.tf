resource "azurerm_resource_group" "rgname" {
  name     = "foodalert898855"
  location = "East Us"
}
data "azurerm_app_service_plan" "example" {
  existasp_name                = var.asp_name
  resource_group_name = azurerm_resource_group.rgname.name
}
module "webapp" {
  source = "../Module/"

  rg_name          = azurerm_resource_group.rgname.name
  rg_location      = azurerm_resource_group.rgname.location
  asp_name     =  var.asp_name
  as_name             = "appservicefoodalerttest1000"
  #env                 = var.r_env
  #asp_name            = "${var.r_prefix}-asp1-${var.r_env}-${random_integer.ri.result}"
  #tier                = "Standard"
  #size                = "S1"
  #webapplist          = ["identity", "webapp"]
  #resource_group_name = azurerm_resource_group.rg.name
  #location            = azurerm_resource_group.rg.location
  #scm_ip_restriction  = ["31.121.101.144/28", "31.121.101.128/29", "202.89.106.0/23"]
  #app_settings = {
   # Angular2URL    = local.v2_url
    #AppURL         = local.webapp_url
    #AtlasAPI       = local.api_url
    #AtlasSTSOrigin = local.identity_url
    #EnableCorsFor  = local.cors
    #WizardApp      = local.wizard_url
  #}

}
  module "webapp1" {
  source = "../Module/"

  rg_name          = azurerm_resource_group.rgname.name
  rg_location      = azurerm_resource_group.rgname.location
  aspname     =  var.existasp_name
  as_name             = "appservicefoodalerttest10001"
  }
 
