resource "azurerm_private_dns_zone" "contoso" {
  name = "contoso.com"
  resource_group_name = azurerm_resource_group.nontnw.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "coreservices_vnet_link" {
  name                  = "CoreServicesVnetLink"
  resource_group_name   = azurerm_resource_group.nontnw.name
  private_dns_zone_name = azurerm_private_dns_zone.contoso.name
  virtual_network_id    = azurerm_virtual_network.core_services_vnet.id
  registration_enabled  = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "manufacturing_vnet_link" {
  name                  = "ManufacturingVnetLink"
  resource_group_name   = azurerm_resource_group.nontnw.name
  private_dns_zone_name = azurerm_private_dns_zone.contoso.name
  virtual_network_id    = azurerm_virtual_network.manufacturing_vnet.id
  registration_enabled  = true
}

resource "azurerm_private_dns_zone_virtual_network_link" "research_vnet_link" {
  name                  = "ResearchVnetLink"
  resource_group_name   = azurerm_resource_group.nontnw.name
  private_dns_zone_name = azurerm_private_dns_zone.contoso.name
  virtual_network_id    = azurerm_virtual_network.research_vnet.id
  registration_enabled  = true
}

