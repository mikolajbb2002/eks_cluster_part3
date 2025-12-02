# Create public route table and association
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.tags, { Name = "${var.vpc_name}-public-rt" })
}

# Create private route tables and association
resource "aws_route_table" "private_az1" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.tags, { Name = "${var.vpc_name}-private-rt1" })
}

resource "aws_route_table" "private_az2" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.tags, { Name = "${var.vpc_name}-private-rt2" })
}

