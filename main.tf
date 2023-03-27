resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "tfstate" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_string.random.id}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "blob-${azurerm_storage_account.tfstate.name}"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}