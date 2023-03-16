 module "rg" {
  # Terraform Cloud PMR use
  source = "../Terraform_azure/Module/Linux_webapp"
  version = "~>1.3.3"

  rg_name     = "foodalert-resourcegroup"
  rg_location      = "East US"
}
