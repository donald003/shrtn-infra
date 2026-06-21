variable "project" {
  description = "Short project name, used as a prefix for resource names"
  type        = string
  default     = "shrtn"
}

variable "environment" {
  description = "Environment name (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region, change to germanywestcentral if a particular SKU isn't available here."
  type        = string
  default     = "francecentral"
}

variable "vnet_address_space" {
  description = "CIDR block for the VNet"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}
