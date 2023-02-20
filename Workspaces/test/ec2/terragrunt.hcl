include "root" {
  path = find_in_parent_folders()
}

terraform {
  source  = "/home/ec2-user/CZ_Terragrut_demo/Modules/ec2"
}


inputs = {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.large"
  tags = {
    Name = "Terragrunt_demo"
  }
}

