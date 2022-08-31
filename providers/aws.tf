provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      "Owner"  = "Terraform"
      "Region" = var.aws_region
    }
  }
}
