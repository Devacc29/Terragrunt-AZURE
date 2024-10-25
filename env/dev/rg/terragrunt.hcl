terraform {
    source = "git::https://github.com/Devacc29/terragrunt-module.git//modules/resourcegroup"
}

include "root" {
    path = find_in_parent_folders()

}

inputs ={
resource_groups = {
    rg1 ={
    name     = "dev-rg-03-pipe"
    location = "westus2"
    tags = {
      env        = "dev"
      created_by = "1234@gmail.com"
    }
    }
  }
}

#     #source = "git::git@github.com:Devacc29/ACEO-MODULES.git//resourcegroup?ref=v1.0.0"
