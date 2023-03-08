resource "aws_vpc" "Default " {
  tags       = merge(var.tags, {})
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.Default.id
  tags              = merge(var.tags, {})
  cidr_block        = var.subnets.b
  availability_zone = "us-east-2b"
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.Default.id
  tags              = merge(var.tags, {})
  cidr_block        = var.subnets.a
  availability_zone = "us-east-2a"
}

resource "aws_eip" "eip_a" {
  tags = merge(var.tags, {})
}

resource "aws_nat_gateway" "nat_gateway_6" {
  tags      = merge(var.tags, {})
  subnet_id = aws_subnet.public_a.id
}

resource "aws_route_table" "rt_public_a" {
  vpc_id = aws_vpc.Default.id
  tags   = merge(var.tags, {})
}

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.Default.id
  tags              = merge(var.tags, {})
  cidr_block        = var.private_subnet.a
  availability_zone = "us-east-2a"
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.Default.id
  tags              = merge(var.tags, {})
  cidr_block        = var.private_subnet.b
  availability_zone = "us-east-2b"
}

resource "aws_route_table" "rt_private_a" {
  vpc_id = aws_vpc.Default.id
  tags   = merge(var.tags, {})
}

resource "aws_eip" "eip_b" {
  tags = merge(var.tags, {})
}

resource "aws_nat_gateway" "nat-gw-2b-public" {
  tags      = merge(var.tags, {})
  subnet_id = aws_subnet.public_b.id
}

resource "aws_route_table" "rt_public_b" {
  vpc_id = aws_vpc.Default.id
  tags   = merge(var.tags, {})
}

resource "aws_route_table" "rt_private_b" {
  vpc_id = aws_vpc.Default.id
  tags   = merge(var.tags, {})
}

resource "aws_internet_gateway" "internet_gateway_14" {
  vpc_id = aws_vpc.Default.id
  tags   = merge(var.tags, {})
}

