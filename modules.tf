module "network" {
  source = "./modules/network"

  aws_region   = var.aws_region
  cluster_name = var.cluster_name
}

module "cluster" {
  source = "./modules/cluster"

  aws_region      = var.aws_region
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_vpc       = module.network.vpc
  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1b = module.network.private_subnet_1b
}