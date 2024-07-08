terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.111.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "YourRGName"
    storage_account_name = "YourSAName"
    container_name       = "YourContainerName"
    key                  = "YourStateFileName"
  }

}

provider "azurerm" {
  features {}
}