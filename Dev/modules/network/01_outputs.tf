output "vpc_id" {
  description = "Identifier of the VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Identifiers of the private subnets."
  value = [
    aws_subnet.public_az1.id,
    aws_subnet.public_az2.id,
  ]
}

output "private_subnet_ids" {
  description = "Identifiers of the private subnets."
  value = [
    aws_subnet.private_az1.id,
    aws_subnet.private_az2.id,
  ]
}

variable "destination_cidr_block" {
  description = "CIDR block for internet-bound traffic."
  type        = string 
}

output "internet_gateway_id" {
  description = "Identifier of the internet gateway attached to the VPC."
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_ids" {
  description = "Identifiers of the NAT gateways."
  value = [
    aws_nat_gateway.az1.id,
    aws_nat_gateway.az2.id,
  ]
}

output "public_route_table_id" {
  description = "Route table handling the public subnets."
  value       = aws_route_table.public.id
}

output "private_route_table_ids" {
  description = "Route tables handling the private subnets."
  value = [
    aws_route_table.private_az1.id,
    aws_route_table.private_az2.id,
  ]
}