terraform {
    source = "git::https://github.com/Devacc29/terragrunt-module.git//modules/virtualnetwork"
}

include "root" {
    path = find_in_parent_folders()

}

dependency "rg" {
  config_path = "../rg"
} 

inputs ={
  resource_group_name =  dependency.rg.outputs.rg_names[0]
  virtual_networks = {
    vnet1 = {
      name          = "prod-vnet-01"
      address_space = ["10.20.0.0/21"]
    }
  }
  subnets = {
    sub1 = {
      name              = "prod-vnet-01-sub1"
      vnet_name         = "prod-vnet-01"
      address_prefixes  = ["10.20.4.0/22"]
      service_endpoints = ["Microsoft.Keyvault"]
    }
  }
}