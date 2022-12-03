provider "azurerm" {
    features{}  
}



variable "resloc" {
    type = map
    default = {
        "US" = "eastus"
        "UK" = "uksouth"
        "IND" = "southindia"
    }
}

resource "azurerm_resource_group" "dep1" {
    
    location = var.resloc["UK"]
    name     = "myrg1"
}