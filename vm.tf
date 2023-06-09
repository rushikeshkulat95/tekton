resource "azurerm_linux_virtual_machine" "azurerm_linux_virtual_machine" {
  for_each              = var.azurerm_linux_virtual_machine
  name                  = join("-", [each.value.name, var.application, var.environment, var.region, each.value.num])
  resource_group_name   = azurerm_resource_group.azurerm_resource_group["rg1"].name
  location              = var.location
  size                  = "Standard_DS2_v2"
  admin_username        = "adminuser"
  network_interface_ids = [azurerm_network_interface.azurerm_network_interface["nic1"].id]

  admin_ssh_key {
    username = "adminuser"

    public_key = file("${path.module}/id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  tags        = local.tags
  custom_data = filebase64("${path.module}/script.sh")

}


# resource "time_sleep" "time_sleep" {
#   depends_on = [ azurerm_linux_virtual_machine.azurerm_linux_virtual_machine ]
#   create_duration = "4m"
# }

# resource "null_resource" "null_resource" {
#   depends_on = [azurerm_linux_virtual_machine.azurerm_linux_virtual_machine, time_sleep.time_sleep]
#   connection {
#     type = "ssh"
#     host = azurerm_linux_virtual_machine.azurerm_linux_virtual_machine["vm1"].public_ip_address
#     user = "adminuser"
#     private_key = file("${path.module}/id_rsa")
#   }
#   provisioner "remote-exec" {
#     inline = [ 
#       "echo ----------- jenkins initial password ----------",
#       "sudo cat /var/lib/jenkins/secrets/initialAdminPassword",
#       "echo ------------------------------------------------",


#       "sudo chown adminuser:adminuser /opt/sonarqube-10.0.0.68432 -R",
#       "export SONAR_JAVA_PATH='/usr/lib/jvm/java-17-openjdk-amd64/bin/java'",
#       "sh /opt/sonarqube-10.0.0.68432/bin/linux-x86-64/sonar.sh start"
#      ]
#   }

# }

# resource "time_sleep" "time_sleep1" {
#   depends_on = [ null_resource.null_resource ]
#   create_duration = "1m"
# }

# resource "null_resource" "null_resource1" {
#   depends_on = [azurerm_linux_virtual_machine.azurerm_linux_virtual_machine, time_sleep.time_sleep1]
#   connection {
#     type = "ssh"
#     host = azurerm_linux_virtual_machine.azurerm_linux_virtual_machine["vm1"].public_ip_address
#     user = "adminuser"
#     private_key = file("${path.module}/id_rsa")
#   }
#   provisioner "remote-exec" {
#     inline = [ 
#       "sudo chown adminuser:adminuser /opt/sonarqube-10.0.0.68432 -R",
#       "export SONAR_JAVA_PATH='/usr/lib/jvm/java-17-openjdk-amd64/bin/java'",
#       "sh /opt/sonarqube-10.0.0.68432/bin/linux-x86-64/sonar.sh start"
#      ]
#   }

# }




# resource "time_sleep" "time_sleep2" {
#   depends_on = [ null_resource.null_resource1 ]
#   create_duration = "1m"
# }

# resource "null_resource" "null_resource2" {
#   depends_on = [azurerm_linux_virtual_machine.azurerm_linux_virtual_machine, time_sleep.time_sleep2]
#   connection {
#     type = "ssh"
#     host = azurerm_linux_virtual_machine.azurerm_linux_virtual_machine["vm1"].public_ip_address
#     user = "adminuser"
#     private_key = file("${path.module}/id_rsa")
#   }
#   provisioner "remote-exec" {
#     inline = [ 
#       "sudo chown adminuser:adminuser /opt/sonarqube-10.0.0.68432 -R",
#       "export SONAR_JAVA_PATH='/usr/lib/jvm/java-17-openjdk-amd64/bin/java'",
#       "sh /opt/sonarqube-10.0.0.68432/bin/linux-x86-64/sonar.sh start"
#      ]
#   }

# }


