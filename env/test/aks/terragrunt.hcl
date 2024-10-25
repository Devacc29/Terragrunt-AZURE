terraform {
    source = "git::https://github.com/Devacc29/terragrunt-module.git//modules/aks"
}

include "root" {
    path = find_in_parent_folders()

}

dependency "rg" {
  config_path = "../rg"
}

dependency "vnet" {
  config_path = "../vnet"
}


inputs ={
  resource_group_name =  dependency.rg.outputs.rg_names[0]
  aks_cluster = {
    name               = "test-aks-aceo-29"
    sku_tier           = "Free"
    dns_prefix         = "test-aks-aceo-29"
    kubernetes_version = "1.30.0"
    pod_subnet_id      = dependency.vnet.outputs.snet_ids["test-vnet-01-sub1"]
  }
}