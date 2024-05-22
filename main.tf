terraform {
  required_version = "1.9.0"





  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
resource "azurerm_resource_group" "rg" {
  name     = "813-1389a37a-hands-on-with-terraform-on-azure"
  location = "westus"
}
module "securestorage1" {
  source               = "app.terraform.io/EZTestOrg/securestorage1/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "strgetest"
}