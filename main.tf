terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

terraform {
      backend "azurerm" {
        resource_group_name  = "testRG"
        storage_account_name = "satest123456789abcd"
        container_name       = "test"
        key                  = "terraform.tfstate"
    }

}


resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_string.resource_code.result}"
  resource_group_name      = "testRG"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}

resource "azurerm_storage_account" "tfstate1" {
  name                     = "t1234fstate${random_string.resource_code.result}"
  resource_group_name      = "testRG"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account" "tfstate2" {
  name                     = "t12345fstate${random_string.resource_code.result}"
  resource_group_name      = "testRG"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = true

  tags = {
    environment = "staging"
  }
}
