resource "azurerm_container_registry" "acr" {
  name                = "${var.project}${var.environment}acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true #left it like that for now
}

resource "azurerm_container_group" "app" {
  name                = "${var.project}-${var.environment}-container-group"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Private"
  os_type             = "Linux"
  subnet_ids          = [var.aci_subnet_id]

  identity {
    type = "SystemAssigned"
  }
  container {
    name   = "api-service"
    image  = "${azurerm_container_registry.acr.login_server}/shrtn:v1"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 8000
      protocol = "TCP"
    }

    environment_variables = {
      "DB_HOST" = var.postgres_fqdn
      "DB_NAME" = "postgres"
      "DB_PORT" = 5432
      "DB_USER" = "psqladmin"
      "DB_SSL" = "true"
      "BASE_URL" = "http://localhost:8000"
    }

    secure_environment_variables = {
      "DB_PASSWORD" = var.db_password
    }
  }

  image_registry_credential {
    server = azurerm_container_registry.acr.login_server
    username = azurerm_container_registry.acr.admin_username
    password = azurerm_container_registry.acr.admin_password
  }
}