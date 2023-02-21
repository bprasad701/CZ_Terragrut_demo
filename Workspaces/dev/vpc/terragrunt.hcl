include "root" {
  path = find_in_parent_folders()
}

include "env" {
  path = "${get_terragrunt_dir()}/../../_env/vpc.hcl"
}

#terraform {
# source = "/home/ec2-user/CZ_Terragrut_demo/Modules/vpc"
#}

# Indicate the input values to use for the variables of the module.


inputs = {
#  name = "terragrunt-demo-vpc"
#  cidr_block = "10.0.0.0/16"

#  enable_nat_gateway = false
#  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

