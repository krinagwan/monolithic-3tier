rg = {
  rg1 = {
    name     = "dev-rg-0001"
    location = "West europe"
    tags = {
      environment = "staging"
    }
  }
}



vnet = {
  vnet1 = {
    vnetname                      = "dev-network"
    address_space                 = ["10.0.0.0/16"]
    location                      = "West europe"
    resource_group_name           = "dev-rg-0001"
    subnetname                    = "dev-subnet-internal"
    address_prefixes              = ["10.0.2.0/24"]
    nicame                        = "example-nic"
    ipconfigname                  = "internal"
    private_ip_address_allocation = "Dynamic"
    tags = {
      environment = "staging"
    }
  }
  vnet2 = {
    vnetname            = "dev-network"
    address_space       = ["10.0.0.0/16"]
    location            = "West europe"
    resource_group_name = "dev-rg-0001"
    basname             = "AzureBastionSubnet"
    address_prefixes    = ["10.0.3.0/26"]
    # nicame                        = "example-nic"
    # ipconfigname                  = "internal"
    # private_ip_address_allocation = "Dynamic"
    tags = {
      environment = "staging"
    }
  }

}

vm = {
  vm1 = {
    name                 = "example-machine"
    location             = "West europe"
    resource_group_name  = "dev-rg-0001"
    size                 = "Standard_F2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "Canonical"
    offer                = "0001-com-ubuntu-server-jammy"
    sku                  = "22_04-lts"
    version              = "latest"
    kvname               = "examplekeyvault"
    nicame               = "example-nic"
    tags = {
      environment = "staging"
    }
  }
}


kv = {
  kv1 = {
    kvname                      = "examplekeyvault"
    location                    = "West europe"
    resource_group_name         = "dev-rg-0001"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"
    tags = {
      environment = "staging"
    }
  }
}


st = {
  st1 = {
    stname                   = "storageaccountname"
    location                 = "West europe"
    resource_group_name      = "dev-rg-0001"
    account_tier             = "Standard"
    account_replication_type = "GRS"

    tags = {
      environment = "staging"
    }
  }
}

bas = {
  bas1 = {

    baspipname          = "baspip"
    location            = "West europe"
    resource_group_name = "dev-rg-0001"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "staging"
    }
    basname         = "bastion-dev"
    basipconfigname = "bastion-ip"
    basname         = "AzureBastionSubnet"
      vnetname            = "dev-network"
  }
}


pip = {
  pip1 = {
    pipname             = "dev-pip-ooo1"
    location            = "West europe"
    resource_group_name = "dev-rg-0001"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags = {
      environment = "staging"
    }
  }
}

acr={
    acr1={
  acrname                = "acr-dev-0001"
  location            = "West europe"
    resource_group_name = "dev-rg-0001"
  sku                 = "Standard"
  admin_enabled       = false


}
tags = {
      environment = "staging"
    }
}