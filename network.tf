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

resource "azurerm_network_interface" "infra" {
  name                = "${local.prefix_snake}-vm-nic"
  location            = azurerm_resource_group.infra.location
  resource_group_name = azurerm_resource_group.infra.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "infra" {
  name                  = "${local.prefix_snake}-vm"
  location              = azurerm_resource_group.infra.location
  resource_group_name   = azurerm_resource_group.infra.name
  network_interface_ids = [azurerm_network_interface.infra.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${local.prefix_snake}-vm-myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}