# IAM Role for EKS Worker Nodes
resource "aws_iam_role" "node_group_role" {
  name = "ecommerce_nodes_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach Required Policies to the Role
resource "aws_iam_role_policy_attachment" "node_group_eks_policy" {
  role       = aws_iam_role.node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "node_group_cni_policy" {
  role       = aws_iam_role.node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "node_group_registry_policy" {
  role       = aws_iam_role.node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# Create an IAM Instance Profile for Worker Nodes
resource "aws_iam_instance_profile" "node_group_instance_profile" {
  name = "ecommerce_nodes_instance_profile"
  role = aws_iam_role.node_group_role.name
}

# EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "ecommerce-cluster"
  cluster_version = "1.27"
  subnet_ids      = [
    aws_subnet.main_subnet.id,
    aws_subnet.secondary_subnet.id
  ]
  vpc_id          = aws_vpc.main.id

  self_managed_node_groups = {
    ecommerce_nodes = {
      desired_capacity = 2
      max_size         = 3
      min_size         = 1
      instance_type = "t3.medium"
      iam_instance_profile = aws_iam_instance_profile.node_group_instance_profile.name
    }
  }

  bootstrap_self_managed_addons = false

  tags = {
    Environment = "Dev"
    Name        = "EcommerceEKS"
  }
}
