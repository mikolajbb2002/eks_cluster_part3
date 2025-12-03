output "cluster_role_arn" {
  description = "IAM role ARN used by the EKS control plane."
  value       = aws_iam_role.cluster.arn
}

output "node_role_arn" {
  description = "IAM role ARN assumed by the node group."
  value       = aws_iam_role.example.arn
}

output "bastion_role_arn" {
  description = "IAM role ARN used by the Bastion host."
  value       = aws_iam_role.bastion_role.arn
}

output "bastion_instance_profile_name" {
  description = "Instance profile name for the bastion host."
  value       = aws_iam_instance_profile.bastion_profile.name
}
