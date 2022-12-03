provider "azurerm" {
    features{}  
}

terraform {
  backend "azurerm" {
    storage_account_name = "tfstorageaccount237"
    container_name = "conatiner1"
    access_key = "u5TZAY62lypMJgcWp5UicSMyYDl3wPF/A0LwqEto3Sf2jRSwr3AktyBoyISV7RC3JP6AWVdWzI4f+ASt2Iv1rA=="
    key = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "deploy1" {
    
    location = "eastus"
    name     = "myrg1"
}