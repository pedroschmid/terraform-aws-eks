output "vpc" {
  value = aws_vpc.vpc
}

output "public_subnet_1a" {
  value = aws_subnet.public_subnet_1a
}

output "public_subnet_1b" {
  value = aws_subnet.public_subnet_1b
}

output "private_subnet_1a" {
  value = aws_subnet.private_subnet_1a
}

output "private_subnet_1b" {
  value = aws_subnet.private_subnet_1b
}

output "internet-gateway" {
  value = aws_internet_gateway.igw
}

output "elastic_ip" {
  value = aws_eip.eip
}

output "nat-gateway" {
  value = aws_nat_gateway.nat
}