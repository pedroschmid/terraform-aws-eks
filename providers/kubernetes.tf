data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster_name
}

provider "kubernetes" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority.0.data)

    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster.name]
      command     = "aws"
    }
  }
}