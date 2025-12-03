resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id
    tags = merge (var.tags, {
        Name = "${var.vpc_name}-igw"
    })
}

resource "aws_nat_gateway" "az1" {
    allocation_id = aws_eip.nat_az1.id
    subnet_id     = aws_subnet.public_az1.id

    tags = merge (var.tags, {
        Name = "${var.vpc_name}-nat-az1"
    })
}

resource "aws_nat_gateway" "az2" {
    allocation_id = aws_eip.nat_az2.id
    subnet_id     = aws_subnet.public_az2.id
    
    tags = merge (var.tags, {
        Name = "${var.vpc_name}-nat-az2"
    })
}

# Elastic ip for NatGW
resource "aws_eip" "nat_az1" {
  domain = "vpc"

  tags = merge(var.tags, { Name = "${var.vpc_name}-nat-eip-az1" })
}

resource "aws_eip" "nat_az2" {
  domain = "vpc"

  tags = merge(var.tags, { Name = "${var.vpc_name}-nat-eip-az2" })
}
