output "eks_cluster" {
  value = aws_eks_cluster.eks_cluster
}

output "master_cluster_sg" {
  value = aws_security_group.master_cluster_sg
}