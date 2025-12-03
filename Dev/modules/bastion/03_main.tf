resource "aws_security_group" "bastion_sg" {
  name        = "bastion-ssm-sg"
  description = "Bastion host used via SSM"
  vpc_id      = var.vpc_id

  # brak ingress – nic nie wpuszczamy
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t3.micro"
  subnet_id                   = var.private_subnet_id
  associate_public_ip_address = false
  iam_instance_profile   = var.iam_instance_profile
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tags = merge(var.tags, { Name = "eks-bastion" })
}