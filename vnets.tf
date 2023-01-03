resource "azurerm_virtual_network" "core_services" {
  name                = "CoreServicesVnet"
  resource_group_name = azurerm_resource_group.nontnw.name
  location            = "eastus"
  address_space       = ["10.20.0.0/16"]
}

resource "azurerm_subnet" "core_gateway" {
  name                                          = "GatewaySubnet"
  resource_group_name                           = azurerm_resource_group.nontnw.name
  virtual_network_name                          = azurerm_virtual_network.core_services.name
  address_prefixes                              = ["10.20.0.0/27"]
  enforce_private_link_service_network_policies = true
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "core_shared_services" {
  name                                          = "SharedServicesSubnet"
  resource_group_name                           = azurerm_resource_group.nontnw.name
  virtual_network_name                          = azurerm_virtual_network.core_services.name
  address_prefixes                              = ["10.20.10.0/24"]
  enforce_private_link_service_network_policies = true
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "core_database" {
  name                                          = "DatabaseSubnet"
  resource_group_name                           = azurerm_resource_group.nontnw.name
  virtual_network_name                          = azurerm_virtual_network.core_services.name
  address_prefixes                              = ["10.20.20.0/24"]
  enforce_private_link_service_network_policies = true
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "core_webservices" {
  name                                          = "PublicWebServiceSubnet"
  resource_group_name                           = azurerm_resource_group.nontnw.name
  virtual_network_name                          = azurerm_virtual_network.core_services.name
  address_prefixes                              = ["10.20.30.0/24"]
  enforce_private_link_service_network_policies = true
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_virtual_network" "manufacturing_vnet" {
  name                = "ManufacturingVnet"
  resource_group_name = azurerm_resource_group.nontnw.name
  location            = "westeurope"
  address_space       = ["10.30.0.0/16"]
}
resource "azurerm_subnet" "manufacturing_system" {
  name                                          = "ManufacturingSystemSubnet"
  resource_group_name                           = azurerm_resource_group.nontnw.name
  virtual_network_name                          = azurerm_virtual_network.manufacturing_vnet.name
  address_prefixes                              = ["10.30.10.0/24"]
  enforce_private_link_service_network_policies = true
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "manufacturing_sensor_1" {
  name                                          = "SensorSubnet1"
  resource_group_name                           = azurerm_resource_group.nontnw.name
  virtual_network_name                          = azurerm_virtual_network.manufacturing_vnet.name
  address_prefixes                              = ["10.30.20.0/24"]
  enforce_private_link_service_network_policies = true
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "manufacturing_sensor_2" {
  name                                          = "SensorSubnet2"
  resource_group_name                           = azurerm_resource_group.nontnw.name
  virtual_network_name                          = azurerm_virtual_network.manufacturing_vnet.name
  address_prefixes                              = ["10.30.21.0/24"]
  enforce_private_link_service_network_policies = true
  enforce_private_link_endpoint_network_policies = true
}
resource "azurerm_subnet" "manufacturing_sensor_3" {
  name                                          = "SensorSubnet3"
  resource_group_name                           = azurerm_resource_group.nontnw.name
  virtual_network_name                          = azurerm_virtual_network.manufacturing_vnet.name
  address_prefixes                              = ["10.30.22.0/24"]
  enforce_private_link_service_network_policies = true
  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_virtual_network" "research_vnet" {
  name                = "ResearchVnet"
  resource_group_name = azurerm_resource_group.nontnw.name
  location            = "southeastasia"
  address_space       = ["10.40.0.0/16"]
}
resource "azurerm_subnet" "research_system" {
  name                                          = "ResearchSystemSubnet"
  resource_group_name                           = azurerm_resource_group.nontnw.name
  virtual_network_name                          = azurerm_virtual_network.research_vnet.name
  address_prefixes                              = ["10.40.40.0/24"]
  enforce_private_link_service_network_policies = true
  enforce_private_link_endpoint_network_policies = true
}
