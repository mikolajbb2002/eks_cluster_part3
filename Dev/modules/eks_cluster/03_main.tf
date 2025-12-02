resource "aws_eks_cluster" "main" {
  name     = var.aws_eks_cluster_name
  role_arn = var.cluster_role_arn


  vpc_config {
    endpoint_private_access = true ####
    endpoint_public_access  = false ####

    subnet_ids = var.cluster_subnet_ids
  }
}

resource "aws_eks_node_group" "example" {
  cluster_name    = var.cluster_name
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

}
