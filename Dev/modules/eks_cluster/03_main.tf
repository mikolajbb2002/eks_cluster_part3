resource "aws_eks_cluster" "main" {
  name     = var.aws_eks_cluster_name
  role_arn = var.cluster_role_arn


  vpc_config {
    endpoint_private_access = true ####
    endpoint_public_access  = false ####

    subnet_ids = var.cluster_subnet_ids
  }
}

resource "aws_security_group_rule" "eks_api_from_bastion" {
  count                    = var.bastion_security_group_id == null ? 0 : 1
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = var.bastion_security_group_id
  security_group_id        = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}


resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = var.aws_eks_node_group
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.node_group_desired_size
    max_size     = var.node_group_max_size
    min_size     = var.node_group_min_size
  }

  instance_types = [var.node_instance_type]
  ami_type       = var.node_ami_type
  disk_size      = var.node_disk_size

  update_config {
    max_unavailable = 1
  }

  depends_on = [aws_eks_cluster.main]
}
