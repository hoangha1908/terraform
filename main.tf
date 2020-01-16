provider "aws" {
   profile    = "default"
   region     = local.AZ1
}

locals {
  # Environment variable
  project="sky_premium"
  environment="stg"
  cidr_block="10.0.0.0/16"
  AZ1="us-east-1"
  AZ2="us-east-2"
  IP-Guest="0.0.0.0/32"
  keyname="hoangha2"

}

/*
module "Bastion"{
  source = "./Instance"
  ami_id = "ami-062f7200baf2fa504" 
  instance_type = "t2.micro"
  key= local.keyname
  publicip="true"
  name = "bastion"
}
*/
module "Vpc" {
  source = "./Vpc"
  cidr_block = local.cidr_block
  project = local.project
  environment = local.environment  
}

