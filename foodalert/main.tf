resource "azurerm_resource_group" "rgname" {
  name     = "marolix-uday-rg"
  location = "East Us"
  tags ={
  ENV = "Dev"
  }
}
resource "azurerm_app_service_plan" "aspname" {
  name                = "marolix-uday-appservice-plan"
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}
resource "azurerm_app_service_plan" "aspname1" {
  name                = "marolix-uday-appserviceplan1"
  location            = azurerm_resource_group.rgname.location
  resource_group_name = azurerm_resource_group.rgname.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}
module "webapp" {
  source = "../Module/"

  rg_name          = azurerm_resource_group.rgname.name
  rg_location        = azurerm_resource_group.rgname.location
  asp_name     =  azurerm_app_service_plan.aspname.id
  as_name             = "appservicefoodalerttest11233"
  #env                 = var.r_env
  #asp_name            = "${var.r_prefix}-asp1-${var.r_env}-${random_integer.ri.result}"
  #tier                = "Basci"
  #size                = "B1"
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
  rg_location        = azurerm_resource_group.rgname.location
  asp_name     =  azurerm_app_service_plan.aspname.id
  as_name             = "appservicefoodalerttest1123344"
  #env                 = var.r_env
  #asp_name            = "${var.r_prefix}-asp1-${var.r_env}-${random_integer.ri.result}"
  #tier                = "Basci"
  #size                = "B1"
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
module "webapp2" {
  source = "../Module/"

  rg_name          = azurerm_resource_group.rgname.name
  rg_location        = azurerm_resource_group.rgname.location
  asp_name     =  azurerm_app_service_plan.aspname1.id
  as_name             = "appservicefoodalerttest11233445"
  #env                 = var.r_env
  #asp_name            = "${var.r_prefix}-asp1-${var.r_env}-${random_integer.ri.result}"
  #tier                = "Basci"
  #size                = "B1"
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
 
