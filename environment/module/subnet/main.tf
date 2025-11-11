resource "azurerm_subnet" "example" {
  
  for_each = var.snet
  name                 = each.value.subnetname
 resource_group_name = each.value.resource_group_name
  virtual_network_name = each.value.vnetname
  address_prefixes     = each.value.address_prefixes
  
}


resource "azurerm_network_interface" "example" {
    for_each = var.snet
  name                = each.value.nicname
   location            = each.value.location
  resource_group_name = each.value.resource_group_name
    tags = each.value.tags

  ip_configuration {
    name                          = each.value.ipconfigname
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}