output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "location" {
  value = azurerm_resource_group.main.location
}

output "vnet_id" {
  value = azurerm_virtual_network.main.id
}

output "vnet_name" {
  value = azurerm_virtual_network.main.name
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "postgres_subnet_id" {
  value = azurerm_subnet.postgres.id
}

output "aci_subnet_id" {
  value = azurerm_subnet.aci.id
}