resource "aws_subnet" "private_subnet_1a" {
  vpc_id = aws_vpc.vpc.id

  cidr_block        = "10.0.32.0/20"
  availability_zone = format("%sa", var.aws_region)

  tags = {
    "Name" = format("%s-private-subnet-1a", var.cluster_name)
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id = aws_vpc.vpc.id

  cidr_block        = "10.0.48.0/20"
  availability_zone = format("%sb", var.aws_region)

  tags = {
    "Name" = format("%s-private-subnet-1b", var.cluster_name)
  }
}

resource "aws_route_table_association" "private_route_table_association_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.nat_route_table.id
}

resource "aws_route_table_association" "private_route_table_association_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.nat_route_table.id
}