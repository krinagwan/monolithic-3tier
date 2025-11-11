data "azurerm_key_vault" "example" {
    for_each = var.vm
  name                        = each.value.kvname
resource_group_name = each.value.resource_group_name
}


data "azurerm_network_interface" "example" {
   for_each = var.vm
  name                = each.value.nicname
resource_group_name = each.value.resource_group_name
}

resource "azurerm_linux_virtual_machine" "example" {
  for_each = var.vm
  name                = each.value.vmname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = data.azurerm_key_vault.example.admin_username[each.key].value
  admin_password = data.azurerm_key_vault.example.admin_password[each.key].value  
    tags = each.value.tags
  network_interface_ids = [
    data.azurerm_network_interface.example.id
    
  ]

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   =each.value.version
  }
}