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