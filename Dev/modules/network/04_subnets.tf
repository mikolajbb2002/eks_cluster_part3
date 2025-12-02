# Create public subnet with cidr defined in 03_main
resource "aws_subnet" "public_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_az1_cidr
  availability_zone       = var.az1
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-public-az1"
    Tier = "public"
  })
}

# Create public subnet with cidr defined in 03_main
resource "aws_subnet" "public_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_az2_cidr
  availability_zone       = var.az2
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-public-az2"
    Tier = "public"
  })
}

# Association with both public subnets.
resource "aws_route_table_association" "public_az1" {
  subnet_id      = aws_subnet.public_az1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_az2" {
  subnet_id      = aws_subnet.public_az2.id
  route_table_id = aws_route_table.public.id
}


# Create private subnet with cidr defined in 03_main
resource "aws_subnet" "private_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_az1_cidr
  availability_zone       = var.az1
  map_public_ip_on_launch = false

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-private-az1"
    Tier = "private"
  })
}

# Create private subnet with cidr defined in 03_main
resource "aws_subnet" "private_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_az2_cidr
  availability_zone       = var.az2
  map_public_ip_on_launch = false

  tags = merge(var.tags, {
    Name = "${var.vpc_name}-private-az2"
    Tier = "private"
  })
}

# Association with private subnets.
resource "aws_route_table_association" "private_az1" {
  subnet_id      = aws_subnet.private_az1.id
  route_table_id = aws_route_table.private_az1.id
}

resource "aws_route_table_association" "private_az2" {
  subnet_id      = aws_subnet.private_az2.id
  route_table_id = aws_route_table.private_az2.id
}
