
locals {
  cluster_name = "${var.prefix}-eks-cluster-${random_string.suffix.result}"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.17.2"

  cluster_name    = local.cluster_name
  cluster_version = "1.29"
  
  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true
  cluster_endpoint_private_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }
  iam_role_additional_policies = {
        additional = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      }
  eks_managed_node_groups = {
    node = {
      name = "${var.prefix}-nodes"
      instance_types = ["t3.small"]
      disk_size       = 20
      min_size     = 1
      max_size     = 2
      desired_size = 1
      tags = {
        Environment = var.environment
      }
    }
}
}
