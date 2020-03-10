locals {
  prefix_snake = "${terraform.workspace}-${var.prefix}"
  prefix_flat  = "${terraform.workspace}${var.prefix}"
}

resource "random_id" "random-id" {
  keepers = {
    # Generate a new id each time we switch to a new resource group
    group_name = azurerm_resource_group.infra.name
  }

  byte_length = 4
}

