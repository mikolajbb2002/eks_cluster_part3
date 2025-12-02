output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = aws_eks_cluster.main.name
}

output "cluster_arn" {
  description = "ARN of the EKS cluster."
  value       = aws_eks_cluster.main.arn
}

output "cluster_endpoint" {
  description = "API server endpoint of the cluster."
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Base64-encoded certificate authority data for the cluster."
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_role_arn" {
  description = "IAM role ARN used by the EKS control plane."
  value       = var.cluster_role_arn
}

output "node_group_arn" {
  description = "ARN of the managed node group."
  value       = aws_eks_node_group.example.arn
}

output "node_group_name" {
  description = "Name of the managed node group."
  value       = aws_eks_node_group.example.node_group_name
}

output "node_role_arn" {
  description = "IAM role ARN assumed by the node group."
  value       = var.node_role_arn
}

output "subnet_ids" {
  description = "Identifiers of the subnets used by the node group."
  value       = var.subnet_ids
}
