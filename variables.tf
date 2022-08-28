variable "aws_region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "k8s"
}

variable "cluster_version" {
  default = "1.23"
}

variable "node_instance_sizes" {
  default = [
    "t2.small"
  ]
}

variable "auto_scale_options" {
  default = {
    min     = 2
    max     = 10
    desired = 2
  }
}