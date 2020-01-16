provider "aws" {
   profile    = "default"
   region     = local.region
}

locals {
  # Environment variable
  project="sky-premium"
  environment="stg"
  cidr_block="10.0.0.0/16"
  region="us-east-1"
  AZa="us-east-1a"
  AZb="us-east-1b"
  AZc="us-east-1c"
  AZd="us-east-1d"
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
  AZa="us-east-1a"
  AZb="us-east-1b"

}

