resource "azurerm_resource_group" "infra" {
  name     = "${local.prefix_snake}-rg"
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "infra" {
  name          = "${local.prefix_snake}-vnet"
  address_space = ["10.0.0.0/16"]

  location            = var.location
  resource_group_name = azurerm_resource_group.infra.name
  tags                = var.tags
}

resource "azurerm_subnet" "infra" {
  name                = "${local.prefix_snake}-subnet"
  resource_group_name = azurerm_resource_group.infra.name

  virtual_network_name = azurerm_virtual_network.infra.name
  address_prefix       = "10.0.2.0/24"
}

