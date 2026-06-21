module "networking" {
  source = "../modules/networking"

  project            = var.project
  environment        = var.environment
  location           = var.location
  vnet_address_space = var.vnet_address_space
}

module "keyvault" {
  source = "../modules/keyvault"

  project = var.project
  environment = var.environment
  location = var.location
  resource_group_name = module.networking.resource_group_name
}