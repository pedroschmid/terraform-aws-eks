resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = format("%s-internet-gateway", var.cluster_name)
  }
}

resource "aws_route_table" "igw_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = format("%s-internet-gateway-route-table", var.cluster_name)
  }
}

resource "aws_route" "igw_route" {
  gateway_id     = aws_internet_gateway.igw.id
  route_table_id = aws_route_table.igw_route_table.id

  destination_cidr_block = "0.0.0.0/0"
}