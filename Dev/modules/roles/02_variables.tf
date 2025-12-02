variable "cluster_iam_role_name" {
  description = "IAM role name for the EKS control plane."
  type        = string
}

variable "nodegroup_iam_role" {
  description = "IAM role name for the managed node group."
  type        = string
}
