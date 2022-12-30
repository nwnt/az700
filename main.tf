terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "nontnw" {
  name     = "nont-networking"
  location = "East US"
}

resource "azurerm_virtual_network" "rg-eus-m01" {
  name                = "rg-eus-m01"
  resource_group_name = azurerm_resource_group.nontnw
  location            = azurerm_resource_group.nontnw.location
  address_space       = ["172.20.0.0/16"]

  subnet {
    name = "web"
    address_prefix = "172.20.1.0/24"
  }
}
