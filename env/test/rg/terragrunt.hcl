terraform {
    source = "git::https://github.com/Devacc29/terragrunt-module.git//modules/resourcegroup"
}

include "root" {
    path = find_in_parent_folders()

}

inputs ={
resource_groups = {
    rg ={
    name     = "test-rg-02-pipe"
    location = "canadaeast"
    tags = {
      env        = "test"
      created_by = "1234@gmail.com"
    }
    }
  }
}