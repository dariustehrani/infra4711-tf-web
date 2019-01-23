provider "azurerm" {
      version = "=1.20.0"


}

/*
Please maintain the credentials outside your git repository e.g. through environment variables.
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
*/

provider "kubernetes" {
}