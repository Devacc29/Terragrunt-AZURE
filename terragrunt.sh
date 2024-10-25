#!/bin/bash
terragrunt run-all init -upgrade
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive
#terragrunt run-all destroy --terragrunt-non-interactive
