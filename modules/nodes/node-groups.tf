resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = format("%s-node-group", var.cluster_name)

  node_role_arn = aws_iam_role.eks_nodes_role.arn

  subnet_ids = [
    var.private_subnet_1a.id,
    var.private_subnet_1b.id
  ]

  instance_types = var.node_instance_types

  scaling_config {
    desired_size = lookup(var.auto_scale_options, "desired_size")
    min_size     = lookup(var.auto_scale_options, "min_size")
    max_size     = lookup(var.auto_scale_options, "max_size")
  }

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}