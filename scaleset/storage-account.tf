resource "azurerm_storage_account" "boot-diagnostics" {
  name                     = "${var.random-id}diag"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags

}

