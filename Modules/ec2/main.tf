terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.7.0"
    }
  }
}

resource "aws_instance" "terragrunt_demo" {
  ami           = var.ami
  instance_type = var.instance_type
}

