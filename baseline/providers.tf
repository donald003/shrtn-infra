terraform {
  required_version = ">= 1.7.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.95"
    }
  }

  # No backend block = local state (terraform.tfstate written to this folder).
  # That's fine solo, with no CI involved. We'll switch to a remote backend
  # later when GitHub Actions enters the picture, since CI runners don't
  # have persistent disk and need somewhere durable to read/write state.
}

provider "azurerm" {
  features {}
}
