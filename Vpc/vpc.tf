resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
         Name = "${var.project}-vpc-${var.environment}"
         Environment = var.environment
       }
}
resource "aws_subnet" "subnet_public_1a" {
  vpc_id = aws_vpc.vpc.id 
  cidr_block ="10.0.1.0/24"
  availability_zone = var.AZa
  map_public_ip_on_launch = true

  tags = {
      Name = "${var.project}-subnet-public-a-${var.environment}"
      Environment = var.environment
  }
}
resource "aws_subnet" "subnet_public_1b" {
  vpc_id = aws_vpc.vpc.id 
  cidr_block ="10.0.2.0/24"
  availability_zone = var.AZb
  map_public_ip_on_launch = true

  tags = {
      Name = "${var.project}-subnet-public-b-${var.environment}"
      Environment = var.environment
  }
}
resource "aws_subnet" "subnet_private_1a" {
  vpc_id = aws_vpc.vpc.id 
  cidr_block ="10.0.11.0/24"
  availability_zone = var.AZa

  tags = {
      Name = "${var.project}-subnet-private-a-${var.environment}"
      Environment = var.environment
  }
}
resource "aws_subnet" "subnet_private_1b" {
  vpc_id = aws_vpc.vpc.id 
  cidr_block ="10.0.21.0/24"
  availability_zone = var.AZb
 
  tags = {
      Name = "${var.project}-subnet-private-b-${var.environment}"
      Environment = var.environment
  }
}
