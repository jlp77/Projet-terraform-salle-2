# Création du VPC
resource "aws_vpc" "ecosop-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "ecosop-vpc"
  }
}

# Sous réseau WEB PUBLIC - ZONE 1
resource "aws_subnet" "web_public_zone1" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.web_public_subnet_cidr_1
  map_public_ip_on_launch = true
  availability_zone       = var.zone_public
  tags = {
    Name = "web_public_subnet_cidr_1"
  }
}

# Sous réseau WEB PUBLIC - ZONE 2
resource "aws_subnet" "web_public_zone2" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.web_public_subnet_cidr_2
  map_public_ip_on_launch = true
  availability_zone       = var.zone_public
  tags = {
    Name = "web_public_subnet_cidr_2"
  }
}

# Sous réseau APP PRIVE - ZONE 1
resource "aws_subnet" "app-private-zone1" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.app_private_subnet_cidr_1
  map_public_ip_on_launch = true
  availability_zone       = var.zone_private
  tags = {
    Name = "app_public_subnet_cidr_1"
  }
}

# Sous réseau APP PRIVE - ZONE 2
resource "aws_subnet" "app-private-zone2" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.app_private_subnet_cidr_2
  map_public_ip_on_launch = true
  availability_zone       = var.zone_private
  tags = {
    Name = "app_public_subnet_cidr_2"
  }
}

# Sous réseau DB PRIVE - ZONE 1
resource "aws_subnet" "db-private-zone1" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.db_private_subnet_cidr_1
  map_public_ip_on_launch = true
  availability_zone       = var.zone_private
  tags = {
    Name = "db_private_subnet_cidr_1"
  }
}

# Sous réseau DB PRIVE - ZONE 2
resource "aws_subnet" "db-private-zone2" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.db_private_subnet_cidr_2
  map_public_ip_on_launch = true
  availability_zone       = var.zone_private
  tags = {
    Name = "db_private_subnet_cidr_2"
  }
}

# GATEWAY
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ecosop-vpc.id
  tags = {
    Name = "internet-gateway"
  }
}

# Table de routage
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.ecosop-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "route-table"
  }
}