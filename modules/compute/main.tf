resource "azurerm_container_registry" "acr" {
  name                = "${var.project}${var.environment}acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true #left it like that for now
}

