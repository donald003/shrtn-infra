data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name = "${var.project}-${var.environment}-kv"
  location = var.location
  resource_group_name = var.resource_group_name
  tenant_id = data.azurerm_client_config.current.tenant_id
  enable_rbac_authorization = true
  purge_protection_enabled = false
  sku_name = "standard"
}

resource "random_password" "pg_password" {
  length           = 24
  special          = true
  override_special = "-_=+"
}

resource "azurerm_key_vault_secret" "pg_password" {
  name         = "postgres-admin-password"
  value        = random_password.pg_password.result
  key_vault_id = azurerm_key_vault.main.id
}