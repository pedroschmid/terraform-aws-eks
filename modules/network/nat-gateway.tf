resource "aws_eip" "eip" {
  vpc = true

  tags = {
    "Name" = format("%s-eip", var.cluster_name)
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    "Name" = format("%s-nat-gateway", var.cluster_name)
  }
}

resource "aws_route_table" "nat_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = format("%s-nat-gateway-route-table", var.cluster_name)
  }
}

resource "aws_route" "nat_route" {
  nat_gateway_id = aws_nat_gateway.nat.id
  route_table_id = aws_route_table.nat_route_table.id

  destination_cidr_block = "0.0.0.0/0"
}