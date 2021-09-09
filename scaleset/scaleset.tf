resource "azurerm_linux_virtual_machine_scale_set" "infra" {
  name                = "${var.prefix}-scaleset"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on          = [azurerm_lb.infra]

  sku       = var.vm_sku
  instances = var.capacity

  computer_name_prefix = var.prefix
  custom_data          = data.template_file.custom-data.rendered


  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_username = var.admin_user

  admin_ssh_key {
    public_key = file(var.path_to_ssh_pubkey)
    username   = var.admin_user
  }

  network_interface {
    name    = "${var.prefix}-nic"
    primary = true

    ip_configuration {
      name                                   = "${var.prefix}-ipconfig"
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bpepool.id]
      primary                                = true
    }
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.boot-diagnostics.primary_blob_endpoint
  }

  # automatic rolling upgrade
  upgrade_mode = "Automatic"
  automatic_os_upgrade_policy {
    enable_automatic_os_upgrade = true
    disable_automatic_rollback  = false
  }



  rolling_upgrade_policy {
    max_batch_instance_percent              = 50
    max_unhealthy_instance_percent          = 50
    max_unhealthy_upgraded_instance_percent = 5
    pause_time_between_batches              = "PT0S"
  }

  # required when using rolling upgrade policy
  health_probe_id = azurerm_lb_probe.infra.id

  tags = var.tags
}



