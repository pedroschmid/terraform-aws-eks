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
    "t3.small"
  ]
}

variable "auto_scale_options" {
  default = {
    desired_size = 2
    min_size     = 2
    max_size     = 10
  }
}

variable "auto_scale_cpu" {
  default = {
    scale_up_threshold  = 80
    scale_up_period     = 60
    scale_up_evaluation = 2
    scale_up_cooldown   = 300
    scale_up_add        = 2

    scale_down_threshold  = 40
    scale_down_period     = 120
    scale_down_evaluation = 2
    scale_down_cooldown   = 300
    scale_down_remove     = -1
  }
}