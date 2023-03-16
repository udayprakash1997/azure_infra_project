resource "azurerm_resource_group" "rg" {
  rg_name     = var.rg_name
  location = var.rg_location
}
