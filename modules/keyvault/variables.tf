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