
module "mrg" {
  source = "../module/resourcegroup"
  rg=var.rg
}

module "mvnet" {
    depends_on = [ var.rg ]
  source = "../module/vnet"
  vnet=var.vnet
}

module "mvm" {
    depends_on = [ module.mvnet,module.mkv ]
  source = "../module/compute"
  vm=var.vm
}
module "mkv" {
  source = "../module/kv"
  kv=var.kv
}
module "mst" {
  source = "../module/storage"
  st=var.st
}
module "mbas" {
    depends_on = [ module.mrg,module.mvnet]
  source = "../module/bastion"
  bas=var.bas
}

module "mpip" {
  depends_on = [ module.mrg,module.mvnet ]
  source = "../module/pip"
  pip=var.pip
}

module "macr" {
  depends_on = [ module.mrg ]
  source = "../module/acr"
  acr=var.acr
}
