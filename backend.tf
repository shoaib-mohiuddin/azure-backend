#terraform {
#  backend "azurerm" {
#    resource_group_name  = "tfstate-rg"
#    storage_account_name = "tfstateb5js3"
#    container_name       = "blob-tfstateb5js3"
#    key                  = "backend/terraform.tfstate"
#  }
#}