variable "project" {
  description = "Short project name, used as a prefix for resource names"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, prod, etc.)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
    description = "Name of the Resource Group the Key Vault is deployed"
    type = string
}

variable "aci_subnet_id" {
  description = "ID of the spoke subnet"
  type = string
}

variable "key_vault_id" {
  description = "ID of the key vault"
  type = string
}

variable "postgres_fqdn" {
  type        = string
  description = "The fully qualified domain name of the PostgreSQL server"
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Database password passed from the generation module"
}