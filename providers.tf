provider "azurerm" {
      version = ">=1.20.0"

}

terraform {
  backend "azurerm" {
    storage_account_name = "infra4711"
    container_name       = "tfstate"
    key                  = "web4711.terraform.tfstate"
  }
}

/*
Please maintain the credentials outside your git repository e.g. through environment variables.
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
*/