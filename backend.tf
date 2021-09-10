terraform {
  backend "azurerm" {
    resource_group_name  = "infra4711"
    storage_account_name = "infra4711"
    container_name       = "tfstate"
    key                  = "web4711.terraform.tfstate"
  }
}