provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "demo" {
    name     = "rg1"
    location = "eastus"
}

resource "azurerm_network_security_group" "demo2" {
    name                = var.nsg_name
    location            = azurerm_resource_group.demo.location
    resource_group_name = azurerm_resource_group.demo.name

    dynamic "security_rule" {
        for_each = var.sec_rules
        content {
            name                       = security_rule.value["name"]
            priority                   = security_rule.value["priority"]
            direction                  = security_rule.value["direction"]
            access                     = security_rule.value["access"]
            protocol                   = security_rule.value["protocol"]
            source_port_range          = security_rule.value["source_port_range"]
            destination_port_range     = security_rule.value["destination_port_range"]
            source_address_prefix      = "*"
            destination_address_prefix = "*"
        }
    }

    tags = {
        environment = "dev"
        
    }
}