output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

output "security_group_id" {
  description = "Security group ID attached to the bastion host."
  value       = aws_security_group.bastion_sg.id
}
