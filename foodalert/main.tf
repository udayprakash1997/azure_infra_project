# Generate a random integer to create a globally unique name
resource "random_integer" "ri" {
  min = 10000
  max = 99999
}


# Create a new Resource Group
resource "azurerm_resource_group" "rg" {
  count    = var.create_rg ? 1 : 0
  name     = "${var.r_prefix}-rg-${var.r_env}-${random_integer.ri.result}"
  location = var.r_location
}

# data "azurerm_app_service_plan" "existing" {
#   count = var.create_rg ? 0 : 1

#   resource_group_name = var.r_existing_aspl_rg
# }

locals {
    l_resource_group_name = var.create_asp == true ? azurerm_resource_group.rg.name[0] : var.r_existing_aspl_rg
}

 
# hsd-transformation-rg-dev

# Create three apps all in linux and containers based.

module "app" {
  source          = "./foodalert/modules/linuxapp"
  create_asp      = var.r_create_asp_linux
  existing_asp    = var.r_existing_aspl
  existing_asp_rg = var.r_existing_aspl_rg
  prefix          = var.r_prefix
  env             = var.r_env
  asp_name        = "${var.r_prefix}-asplinux-${var.r_env}-${random_integer.ri.result}"
  image_name      = "foodalert"
  tier            = "Basic"
  size            = "B1"
  location        = "north europe"
  # webapplist              = ["riskassessmentsapp", "graphapi", "safetyfirstapi"]
  webapplist          = var.r_app_names
  resource_group_name = local.l_resource_group_name
  #scm_ip_restriction  = ["31.121.101.144/28", "31.121.101.128/29", "202.89.106.0/23"]
  app_settings = {
    PORT = "8000"
  }

}

# hsdriskassessmentsappuat
# hsdgraphapiuat
# hsdsafetyfirstapiuat
