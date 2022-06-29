resource "aws_vpc" "eks_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    "name" = "eksVpc"
  }
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id
  tags = {
    "name" = "eksIGW"
  }
}

resource "aws_subnet" "public-us-east-1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.pubsub1_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-us-east-1a"
    #   "kubernetes.io/cluster/k8sdemo" = "shared"
    #    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public-us-east-1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.pubsub2_cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-us-east-1b"
    #    "kubernetes.io/cluster/k8sdemo" = "shared"
    #    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public-us-east-1c" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = var.pubsub3_cidr
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "public-us-east-1c"
    #    "kubernetes.io/cluster/k8sdemo" = "shared"
    #    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }
  tags = {
    "Name" = "eksPublicRtb"
  }
}

resource "aws_main_route_table_association" "mainRTB" {
  vpc_id         = aws_vpc.eks_vpc.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public-us-east-1a" {
  subnet_id      = aws_subnet.public-us-east-1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-east-1b" {
  subnet_id      = aws_subnet.public-us-east-1b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-us-east-1c" {
  subnet_id      = aws_subnet.public-us-east-1c.id
  route_table_id = aws_route_table.public.id
}

