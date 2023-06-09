terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}

provider "azurerm" {
  client_id       = "d87affc4-6422-423c-ac95-7b1aa88f9333"
  tenant_id       = "f53e9d0d-057a-4bcf-9246-4da36efb8e48"
  client_secret   = "~Dl8Q~P~XX3CYhnpIEcgH5N4dy9-fvQN_qRiVaS9"
  subscription_id = "eabf3474-dce6-456d-8c09-d9a8284aa4d5"
  features {}
}

provider "null" {
  # Configuration options
}

provider "time" {
  # Configuration options
}