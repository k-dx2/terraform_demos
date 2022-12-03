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
#command to run this file along with the variable file is
# terraform plan -var-file="values.tfvars"