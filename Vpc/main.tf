resource "aws_vpc" "$${var.project}-vpc-$${var.environment}" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_classiclink = false
  instance_tenancy = "default"
  tags = {
         Name = "${var.project}-vpc-${var.environment}"
         Environment = var.environment
       }
}

