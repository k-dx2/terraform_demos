provider "azurerm" {
    features{}
}

variable "rgname" {
    type = list
    default = ["myresgrp1" , "myresgrp2" , "rgrp3"]
}

variable "rgloc" {
    type = list
    default = ["eastus" , "uksouth" , "southindia"]
}

resource "azurerm_resource_group" "demo1" {
  
  count = length(var.rgname)
  
  name = var.rgname[count.index]
  location = var.rgloc[count.index]
}