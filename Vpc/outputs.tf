output "vpc" {
  value = aws_vpc.vpc.id
  value = aws_vpc.vpc.tag.*
  }
