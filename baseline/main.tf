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

module "database" {
  source = "../modules/database"

  project = var.project
  environment = var.environment
  location = var.location
  resource_group_name = module.networking.resource_group_name
  vnet_id = module.networking.vnet_id
  postgres_subnet_id = module.networking.postgres_subnet_id
  pg_password = module.keyvault.pg_password
}

module "compute" {
  source = "../modules/compute"

  project = var.project
  environment = var.environment
  location = var.location
  resource_group_name = module.networking.resource_group_name

}