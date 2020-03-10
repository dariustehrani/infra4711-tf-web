resource "azurerm_linux_virtual_machine_scale_set" "infra" {
  name                = "${var.prefix}-scaleset"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_lb.infra]

  sku                  = var.vm_sku
  instances            = var.capacity
 
  computer_name_prefix = var.prefix
  custom_data = data.template_file.custom-data.rendered

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  
  
  admin_ssh_key {
      public_key = file(var.path_to_ssh_pubkey)
      username      = var.admin_user
    }

  network_interface {
    name    = "${var.prefix}-nic"
    primary = true

    ip_configuration {
      name                                   = "${var.prefix}-ipconfig"
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bpepool.id]
      #  load_balancer_inbound_nat_rules_ids    = ["${element(azurerm_lb_nat_pool.natpool.*.id, count.index)}"]
      primary = true
    }
  }

  tags = var.tags
}

