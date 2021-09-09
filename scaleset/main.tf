locals {
  prefix_snake = "${terraform.workspace}-${var.prefix}"
  prefix_flat  = "${terraform.workspace}${var.prefix}"
}

