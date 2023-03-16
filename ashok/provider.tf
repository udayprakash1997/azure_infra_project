terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.41.0"
    }
  }

  backend "azurerm" {

  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}

}
