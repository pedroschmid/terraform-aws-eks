variable "aws_region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "k8s"
}

variable "cluster_version" {
  default = "1.23"
}

variable "node_instance_types" {
  default = [
    "t2.micro"
  ]
}

variable "auto_scale_options" {
  default = {
    desired_size = 2
    min_size     = 2
    max_size     = 10
  }
}