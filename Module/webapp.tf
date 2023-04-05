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
  #app_settings = #{
   
   # "DOCKER_REGISTRY_SERVER_PASSWORD"           = "value"
   # "DOCKER_REGISTRY_SERVER_URL"                = "value"
   # "DOCKER_REGISTRY_SERVER_USERNAME"           = "value"
  #}
  tags ={
    Application_Type=var.Application_Type
    Application_Name=var.Application_Name
    Application_Environment=var.Application_Environment
    Brand_name=var.Brand_name
    Business_Unit=var.Business_Unit
    Product=var.Product
    Cost_center=var.Cost_center
    Deploy_type=var.Deploy_type
    Access_type=var.Access_type
    Shared_Resources=var.Shared_Resources
    Shared_by=var.Shared_by
    Service_Type=var.Service_Type
    Created_On=var.Created_On
    JIRA_ID=var.JIRA_ID
    Auto_scale=var.Auto_scale
    Start_Stop=var.Start_Stop
    
  }
}

