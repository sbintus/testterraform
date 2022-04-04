provider "azurerm" {
  features{}
}

resource "azurerm_storage_account" "example" {
  name                     = "sabinttest1234567"
  resource_group_name      = "testRG"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
