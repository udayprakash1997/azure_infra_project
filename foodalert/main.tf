resource "azurerm_resource_group" "rgname" {
  name     = "foodalertresourecegroup1430"
  location = "japanwest"
}
module "webapp" {
  source = "../Module/"

  rg_name          = azurerm_resource_group.rgname.name
  rg_location        = azurerm_resource_group.rgname.location
  asp_name     =  "appserviceplanfoodalerttest1"
  as_name             = "appservicefoodalerttest1"
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
  rg_location        = azurerm_resource_group.rgname.name
  asp_name     =  "appserviceplanfoodalerttest2"
  as_name             = "appservicefoodalerttest2"
    
  }
    
  module "app" {
  source = "../Module/"

  rg_name          = azurerm_resource_group.rgname.name
  rg_location        = azurerm_resource_group.rgname.name
  asp_name     =  "appserviceplanfoodalerttest3"
  as_name             = "appservicefoodalerttest3"
    
  }


