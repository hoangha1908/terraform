provider "aws" {
   profile    = "default"
}

# Collect the lastest amazon ami
data "aws_ami" "ubuntu_lastest"{
  most_recent = true
  owners = ["099720109477"]
  filter{
    name ="name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  filter{
    name = "virtualization-type"
    values = ["hvm"]
  }
}

locals {
  # Environment variable
  project="hoangha"
  environment="stg"
  AZ1="us-east-1"
  AZ2="us-east-2"
  IP-Guest="0.0.0.0/32"
  keyname="hoangha2"
}

module "Bastion"{
  source = "./modules/Instance"
  ami_id = "${data.aws_ami.ubuntu_lastest.id}" 
  instance_type = "t2.micro"
  key= "${local.keyname}"
  publicip="true"
  name = "bastion"
}