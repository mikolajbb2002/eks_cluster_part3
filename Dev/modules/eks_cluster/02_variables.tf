variable "aws_eks_cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "cluster_subnet_ids" {
  description = "Subnet IDs for the EKS cluster networking (private/public as needed)."
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster to attach the node group to."
  type        = string
}

variable "aws_eks_node_group" {
  description = "Name of the managed node group."
  type        = string
}

variable "node_group_desired_size" {
  description = "Desired number of nodes for the group."
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum number of nodes for the group."
  type        = number
}

variable "node_group_min_size" {
  description = "Minimum number of nodes for the group."
  type        = number
}

variable "node_instance_type" {
  description = "EC2 instance type for the node group."
  type        = string
}

variable "node_ami_type" {
  description = "AMI type for the managed node group (e.g., AL2_x86_64)."
  type        = string
}

variable "node_disk_size" {
  description = "Root volume size (GiB) for nodes."
  type        = number
}

variable "subnet_ids" {
  description = "Subnet IDs where the node group will run."
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "IAM role ARN used by the EKS control plane."
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN assumed by the node group."
  type        = string
}

variable "bastion_security_group_id" {
  description = "Security group ID of the bastion host allowed to reach the EKS API."
  type        = string
  default     = null
}
