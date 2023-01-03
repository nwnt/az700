resource "azurerm_virtual_network_gateway" "core_services_gateway" {
  name                = "CoreServicesVnetGateway"
  resource_group_name = azurerm_resource_group.nontnw.name
  location            = azurerm_virtual_network.core_services.location
  type                = "Vpn"
  vpn_type            = "RouteBased"
  sku                 = "VpnGw1"
  generation          = "Generation1"
  enable_bgp          = false
  active_active       = false

  ip_configuration {
    name                          = "vnetGatewayConfig"
    subnet_id                     = azurerm_subnet.core_gateway.id
    public_ip_address_id          = azurerm_public_ip.core_services_gateway.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_public_ip" "core_services_gateway" {
  name                = "CoreServicesVnetGateway-ip"
  location            = azurerm_virtual_network.core_services.location
  resource_group_name = azurerm_resource_group.nontnw.name

  sku               = "Basic"
  allocation_method = "Dynamic"
}
