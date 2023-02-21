terraform {
  source = "/home/ec2-user/CZ_Terragrut_demo/Modules//vpc"
}

inputs = {
  name = "terragrunt-demo-vpc"
  cidr_block = "10.0.0.0/16"

  enable_nat_gateway = false
  enable_vpn_gateway = false
}


