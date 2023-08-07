resource "azurerm_virtual_machine" "example" {
  name                  = "myVM"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_DS1_v2"

  storage_os_disk {
    name              = "myOsDisk"
    caching           = "ReadWrite"
    create_option    = "FromImage"
    image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
  }

  os_profile {
    computer_name  = "myvm"
    admin_username = "adminuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      path     = "/home/adminuser/.ssh/authorized_keys"
      key_data = "your-ssh-public-key"
    }
  }
}

# Provision Nginx using a provisioner (remote-exec in this case)
resource "null_resource" "install_nginx" {
  depends_on = [azurerm_virtual_machine.example]

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      host        = azurerm_public_ip.example.ip_address
      user        = "adminuser"
      private_key = file("~/.ssh/id_rsa")
    }
  }
}