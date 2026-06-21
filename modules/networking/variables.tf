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

variable "vnet_address_space" {
  description = "CIDR block(s) for the VNet"
  type        = list(string)
}

variable "aks_subnet_prefix" {
  description = "CIDR for the AKS node subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "postgres_subnet_prefix" {
  description = "CIDR for the delegated Postgres subnet"
  type        = string
  default     = "10.10.2.0/24"
}
