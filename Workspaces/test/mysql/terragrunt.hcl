include "root" {
  path = find_in_parent_folders()
}

terraform {
  source  = "/home/ec2-user/CZ_Terragrut_demo/Modules/mysql"
}

inputs = {
  instance_class    = "db.t2.medium"
  allocated_storage = 100
  aws_region        = "us-east-1"
  name              = "terragrunt-demo-db"
  storage_type      = "standard"
  master_username   = "bprasad701"
  master_password   = "admin"
}

