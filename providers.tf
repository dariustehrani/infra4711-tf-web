terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.76.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "null" {
  # Configuration options
}

provider "local" {
  # Configuration options
}

provider "azurerm" {
  features {}
}


/*
Please maintain the credentials outside your git repository e.g. through environment variables.
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
*/
