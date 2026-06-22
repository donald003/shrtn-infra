resource "azurerm_private_dns_zone" "postgres" {
  name = "${var.project}-${var.environment}.postgres.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres" {
  name = "${var.project}-${var.environment}-network-link"
  private_dns_zone_name = azurerm_private_dns_zone.postgres.name
  virtual_network_id = var.vnet_id
  resource_group_name = var.resource_group_name
}

resource "azurerm_postgresql_flexible_server" "postgres" {
  name = "${var.project}-${var.environment}-postgres"
  resource_group_name = var.resource_group_name
  location = var.location
  version = "15"
  zone = "1"

  delegated_subnet_id = var.postgres_subnet_id
  private_dns_zone_id = azurerm_private_dns_zone.postgres.id

  public_network_access_enabled = false
  administrator_login = "psqladmin"
  administrator_password = var.pg_password
  depends_on = [ azurerm_private_dns_zone_virtual_network_link.postgres ]

  sku_name = "B_Standard_B1ms"
  storage_mb = 32768
  geo_redundant_backup_enabled = false
  backup_retention_days = 7
}