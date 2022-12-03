provider "azurerm" {
  features {
    
  }
}

variable "subnets" {
  type = list(object(
    {
      name = string
      address_prefix = string
    }

  ))
  default = [
    {
      name           = "snet01"
      address_prefix = "192.168.1.0/24"
    },
    {
      name           = "snet02"
      address_prefix = "192.168.2.0/24"
    }
]
}



resource "azurerm_resource_group" "dep1" {
  name = "rg1"
  location = "eastus"  
  
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-westus2"
  resource_group_name = "rg1"
  location            = "eastus"
  address_space       = ["192.168.0.0/16"]
  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
}
