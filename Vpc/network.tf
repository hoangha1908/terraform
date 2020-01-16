resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
      Name = "${var.project}-igw-${var.environment}"
      Environment = var.environment
  }
}
resource "aws_route_table" "route_table_public" {
  vpc_id=aws_vpc.vpc.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
      Name = "${var.project}-route-public-${var.environment}"
      Environment = var.environment
  }
}
resource "aws_route_table" "route_table_private" {
  vpc_id=aws_vpc.vpc.id
   tags = {
      Name = "${var.project}-route-private-${var.environment}"
      Environment = var.environment
  }
}
resource "aws_route_table_association" "Association_subnet_public_a" {
   subnet_id = aws_subnet.subnet_public_1a.id
   route_table_id = aws_route_table.route_table_public.id
}
resource "aws_route_table_association" "Association_subnet_public_b" {
   subnet_id = aws_subnet.subnet_public_1b.id
   route_table_id = aws_route_table.route_table_public.id
}
resource "aws_route_table_association" "Association_subnet_private_a" {
   subnet_id = aws_subnet.subnet_private_1a.id
   route_table_id = aws_route_table.route_table_private.id
}
resource "aws_route_table_association" "Association_subnet_private_b" {
   subnet_id = aws_subnet.subnet_private_1b.id
   route_table_id = aws_route_table.route_table_private.id
}