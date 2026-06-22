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

variable "vnet_id" {
  description = "The vnet ID for database"
  type = string
}

variable "postgres_subnet_id" {
  description = "The subnet ID for database"
  type = string
}

variable "pg_password" {
  description = "The password for pg admin"
}