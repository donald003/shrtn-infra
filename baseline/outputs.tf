output "resource_group_name" {
  value = module.networking.resource_group_name
}

output "location" {
  value = module.networking.location
}

output "vnet_id" {
  value = module.networking.vnet_id
}

output "vnet_name" {
  value = module.networking.vnet_name
}

output "aks_subnet_id" {
  value = module.networking.aks_subnet_id
}

output "postgres_subnet_id" {
  value = module.networking.postgres_subnet_id
}

output "vault_id" {
  value = module.keyvault.vault_id
}

output "vault_uri" {
  value = module.keyvault.vault_uri
}

output "vault_name" {
  value = module.keyvault.vault_name
}

output "pg_password" {
  value = module.keyvault.pg_password
  sensitive = true
}

output "postgresql_server_name" {
  value = module.database.postgresql_server_name
}
output "postgresql_server_fqdn" {
  value = module.database.postgresql_server_fqdn
}
output "postgresql_server_id" {
  value = module.database.postgresql_server_id
}
