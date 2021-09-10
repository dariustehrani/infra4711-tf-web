provider "azurerm" {
  version = ">=2.76"
  features {}

}

provider "local" {
  version = ">=2.1.0"
}

provider "random" {
  version = ">=3.1.0"
}

provider "null" {
  version = ">=3.1.0"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "infra4711"
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
