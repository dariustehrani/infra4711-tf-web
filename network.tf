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

resource "azurerm_subnet" "infra-bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.infra.name
  virtual_network_name = azurerm_virtual_network.infra.name
  address_prefix       = "10.0.99.0/27"
}

resource "azurerm_public_ip" "infra-bastion-pip" {
  name                = "${local.prefix_snake}-bastion-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.infra.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags

}

resource "azurerm_bastion_host" "infra-bastion" {
  name                = "${local.prefix_snake}-bastion"
  location            = var.location
  resource_group_name = azurerm_resource_group.infra.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.infra-bastion.id
    public_ip_address_id = azurerm_public_ip.infra-bastion-pip.id
  }

  tags = var.tags
}