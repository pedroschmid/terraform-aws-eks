resource "aws_security_group" "cluster_sg" {
  vpc_id = var.cluster_vpc.id

  name = format("%s-cluster-security-group", var.cluster_name)

  tags = {
    "Name" = format("%s-cluster-security-group", var.cluster_name)
  }
}

resource "aws_security_group_rule" "cluster_ingress_https" {
  type              = "ingress"
  description       = "HTTPS traffict"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] // Should be corporative range or bastion range
  ipv6_cidr_blocks  = ["::/0"]
  prefix_list_ids   = []
  security_group_id = aws_security_group.cluster_sg.id
}

resource "aws_security_group_rule" "cluster_egress_default" {
  type              = "egress"
  description       = "For all outgoing traffict"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  prefix_list_ids   = []
  security_group_id = aws_security_group.cluster_sg.id
}