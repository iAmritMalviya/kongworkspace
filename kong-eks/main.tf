module "eks-cluster" {
    source = "./eks-cluster/"
  #  cluster_name = var.cluster_name
#    aws_region = var.aws_region
 #   vpc_cidr_block = var.vpc_cidr_block
 #   instance_types = var.instance_types
 #   no_of_public_subnet = var.no_of_public_subnet
}

module "argocd" {
    source = "./argocd/"
}

module "kubectl" {
    source = "./kubectl/"
}
