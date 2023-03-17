resource "random_integer" "ri" {
  min = 10000
  max = 99999
}


# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.r_prefix}rg-${var.r_env}-${random_integer.ri.result}"
  location = var.r_location
}


module "webapp" {
  source = "../Module/"

  create_asp          = var.r_create_asp
  existing_asp        = var.r_existing_asp
  existing_asp_rg     = var.r_existing_asp_rg
  prefix              = var.r_prefix
  env                 = var.r_env
  asp_name            = "${var.r_prefix}-asp1-${var.r_env}-${random_integer.ri.result}"
  tier                = "Standard"
  size                = "S1"
  webapplist          = ["identi", "webapp1"]
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  #scm_ip_restriction  = ["31.121.101.144/28", "31.121.101.128/29", "202.89.106.0/23"]
  #app_settings= #{
   # Angular2URL    = local.v2_url
    #AppURL         = local.webapp_url
    #AtlasAPI       = local.api_url
    #AtlasSTSOrigin = local.identity_url
    #EnableCorsFor  = local.cors
    #WizardApp      = local.wizard_url
  #}

}

