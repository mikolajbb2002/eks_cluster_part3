resource "aws_security_group" "ssm_vpc_endpoints" {
  name        = "${var.vpc_name}-ssm-sg"
  description = "SG for SSM VPC endpoints"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.this.cidr_block]
  }
  }

resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type   = "Interface"
  subnet_ids = [
    aws_subnet.private_az1.id,
    aws_subnet.private_az2.id,
  ]
  security_group_ids  = [aws_security_group.ssm_vpc_endpoints.id]
  private_dns_enabled = true

  tags = var.tags
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type   = "Interface"
  subnet_ids = [
    aws_subnet.private_az1.id,
    aws_subnet.private_az2.id,
  ]
  security_group_ids  = [aws_security_group.ssm_vpc_endpoints.id]
  private_dns_enabled = true

  tags = var.tags
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type   = "Interface"
  subnet_ids = [
    aws_subnet.private_az1.id,
    aws_subnet.private_az2.id,
  ]
  security_group_ids  = [aws_security_group.ssm_vpc_endpoints.id]
  private_dns_enabled = true

  tags = var.tags
}
