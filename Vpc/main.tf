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
resource "aws_subnet" "subnet_public" {
  vpc_id = aws_vpc.vpc.id 
  cidr_block ="10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
      Name = "${var.project}-subnet_public-${var.environment}"
      Environment = var.environment
  }
}

