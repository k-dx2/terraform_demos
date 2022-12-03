
provider "azurerm" {
  features {}

  

}

variable "vm_name_pfx" {
  description = "VM Names"
  default     = "yourname-"
  type        = string
}

variable "vm_count" {
  description = "Number of Virtual Machines"
  default     = 2
  type        = string
}

resource "azurerm_resource_group" "main" {
  name     = "rg1"
  location = "eastus"
}
resource "azurerm_virtual_network" "main" {
  name                = "vnet1-network"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_public_ip" "main" {
  count               = var.vm_count
  name                = "${var.vm_name_pfx}-${count.index}-pip"
  resource_group_name = azurerm_resource_group.main.name
  location            = "eastus"
  allocation_method   = "Static"
}


resource "azurerm_network_interface" "main" {
  count               = var.vm_count
  name                = "${var.vm_name_pfx}-${count.index}-nic"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.main.name



  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main[count.index].id
  }
}
resource "azurerm_linux_virtual_machine" "main" {
  count               = var.vm_count # Count Value read from variable
  name                = "${var.vm_name_pfx}-${count.index}" # Name constructed using count and pfx
  resource_group_name = azurerm_resource_group.main.name
  location            = "eastus"
  size                = "Standard_B1ms"
  admin_username      = "vmadmin"
  admin_password      = "p@ssw0rd13579"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.main[count.index].id,
  ]

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

   source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

output "public_ip_address" {
  value = "${azurerm_public_ip.main.*.ip_address}"
}

resource "null_resource" "nr1" {
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
	  "sudo apt-get install -y apache2",
	  "sudo service apache2 start",
	  "sudo chmod -R 777 /var/www/html",
	  "sudo echo '<h1>Hello my app from node1</h1>' > /var/www/html/index.html"
    ]

    connection {
      host     = "${element(azurerm_linux_virtual_machine.main.*.public_ip_address, 0)}"
      user     = "vmadmin"
      password = "p@ssw0rd13579"
    }
}
}


resource "null_resource" "nr2" {
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
	  "sudo apt-get install -y apache2",
	  "sudo service apache2 start",
	  "sudo chmod -R 777 /var/www/html",
	  "sudo echo '<h1>Hello my app from node2</h1>' > /var/www/html/index.html"
    ]

    connection {
      host     = "${element(azurerm_linux_virtual_machine.main.*.public_ip_address, 1)}"
      user     = "vmadmin"
      password = "p@ssw0rd13579"
    }
}
}
