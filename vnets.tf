resource "azurerm_virtual_network" "core_services_vnet" {
  name                = "CoreServicesVnet"
  resource_group_name = azurerm_resource_group.nontnw.name
  location            = "eastus"
  address_space       = ["10.30.0.0/16"]

  subnet {
    name           = "WebSubnet"
    address_prefix = "10.30.30.0/24"
  }
  subnet {
    name           = "SharedSubnet"
    address_prefix = "10.30.10.0/24"
  }
  subnet {
    name           = "DatabaseSubnet"
    address_prefix = "10.30.20.0/24"
  }
  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.30.0.0/27"
  }
}

resource "azurerm_virtual_network" "manufacturing_vnet" {
  name                = "ManufacturingVnet"
  resource_group_name = azurerm_resource_group.nontnw.name
  location            = "westeurope"
  address_space       = ["10.40.0.0/16"]

  subnet {
    name           = "ManufactSubnet"
    address_prefix = "10.40.10.0/24"
  }
  subnet {
    name           = "SensorSubnet1"
    address_prefix = "10.40.20.0/24"
  }
  subnet {
    name           = "SensorSubnet2"
    address_prefix = "10.40.21.0/24"
  }
  subnet {
    name           = "SensorSubnet3"
    address_prefix = "10.40.22.0/24"
  }
}

resource "azurerm_virtual_network" "research_vnet" {
  name = "ResearchVnet"
  resource_group_name = azurerm_resource_group.nontnw.name
  location            = "southeastasia"
  address_space       = ["10.20.0.0/16"]
  subnet {
    name           = "ResearchSubnet"
    address_prefix = "10.20.0.0/24"
  }
}

