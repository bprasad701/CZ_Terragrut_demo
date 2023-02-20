terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.7.0"
    }
  }
}

# Creates a VPC

resource "aws_vpc" "terragrunt_demo" {
  cidr_block = "${var.cidr_block}"

}

output "vpc" {
value = "aws_vpc.terragrunt_demo.id"
}

# To create an IG

resource "aws_internet_gateway" "terragrunt_ig" {
  vpc_id = "${aws_vpc.terragrunt_demo.id}"
 
  tags = {
    Name = "terragrunt-demo-ig"
   }
}


#To create a route table 

resource "aws_route_table" "tg_demo" {
  vpc_id = "${aws_vpc.terragrunt_demo.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terragrunt_ig.id
}
}

#Route table association

resource "aws_main_route_table_association" "tg_new" {
vpc_id = "${aws_vpc.terragrunt_demo.id}"
route_table_id = "${aws_route_table.tg_demo.id}"
}

#To create subnets in each availability zone

resource "aws_subnet" "tg_demo" {

count = "${length(data.aws_availability_zones.available.names)}"
vpc_id = "${aws_vpc.terragrunt_demo.id}"
cidr_block = "10.0.${count.index}.0/24"
map_public_ip_on_launch = true
availability_zone = "{element(data.aws_availability_zones.available.names, count.index)}"

tags = {
Name = "my-tg-public-subnet-${element(data.aws_availability_zones.available.names, count.index)}"
}
}


# Security group

resource "aws_security_group" "tg_sg" {
name = "terragrunt_demo_sg"
vpc_id = "${aws_vpc.terragrunt_demo.id}"

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks =  ["0.0.0.0/0"]
}

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks =  ["0.0.0.0/0"]
}

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks =  ["0.0.0.0/0"]
}

ingress {
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks =  ["0.0.0.0/0"]
}
}
