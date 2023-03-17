variable "r_prefix" {
  type        = string
  description = "Prefix for the application names"
  default     = "foodalert"
}

variable "r_env" {
  type        = string
  description = "Set the environment name like prod, dev, qa, uat or DR"
  default     = "foodalertqa"
}

variable "r_location" {
  type = string
  description = "You should provide an Azure location for your resources"
  default = "Uk South"
}

variable "r_create_asp" {
  type = bool
  description = "Set this to false to use the existing app service plan for Windows apps"
}

variable "r_create_asp_linux" {
  type = bool
  description = "Set this to false to use the existing app service plan for Linux (V2) apps"
}

#####################################################################################################
# The following are mandatory values when new resources are built on top of existing infrastructure.#
#####################################################################################################


variable "r_existing_aspl" {
  type = string
  description = "Give the name of the existing Linux App Service plan, only if the 'r_create_asp_linux' is set to false"
}

variable "r_existing_aspl_rg" {
  type = string
  description = "Give the name of the Resource group for r_existing_aspl, if the 'r_create_asp_linux' is set to false"
}

variable "r_existing_asp" {
  type = string
  description = "Give the name of the existing Windows App Service plan, only if the 'r_create_asp' is set to false"
}

variable "r_existing_asp_rg" {
  type = string
  description = "Give the name of the Resource group for 'r_existing_asp', if the 'r_create_asp' is set to false"

}

# To generate URLs dynamically and configure them in app settings. Do not change anything below this line.

#locals #{
 # wizard_url    = "https://${var.r_prefix}wizard${var.r_env}.azurewebsites.net"
 # reporting_url = "https://${var.r_prefix}reporting${var.r_env}.azurewebsites.net"
  #webapp_url    = "https://${var.r_prefix}webapp${var.r_env}.azurewebsites.net"
  #identity_url  = "https://${var.r_prefix}identity${var.r_env}.azurewebsites.net"
  #api_url       = "https://${var.r_prefix}api${var.r_env}.azurewebsites.net"
  #v2_url        = "https://${var.r_prefix}v2${var.r_env}.azurewebsites.net"
  #cors          = join(", ", [local.v2_url, local.webapp_url, local.api_url, local.identity_url, local.wizard_url])

#}
