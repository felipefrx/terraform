module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "cluster"
  cluster_version = "1.33"

  bootstrap_self_managed_addons = true
  # cluster_addons = {
  #   coredns                = {}
  #   eks-pod-identity-agent = {}
  #   kube-proxy             = {}
  #   vpc-cni                = {}
  # }

  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = "vpc-0ae35629622cb77c7"
  subnet_ids               = ["subnet-060d8a8e2f5e2e80f", "subnet-07efea2e30128b756", "subnet-0f8f42157cf48cb3a"]
  # control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

  # EKS Managed Node Group(s)
  # eks_managed_node_group_defaults = {
  #   instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  # }

  eks_managed_node_groups = {
    default = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.large"]

      min_size     = 2
      max_size     = 2
      desired_size = 2
    }
  }

  tags = {
    Environment = "sandbox"
    Terraform   = "true"
  }
}