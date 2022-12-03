provider "azurerm" {
    features{}  
}
variable "rgname" {
    type = string
}

variable "rloc" {
    type = string
    
}

resource "azurerm_resource_group" "dep1" {
    
    location = var.rloc
    name     = var.rgname
}