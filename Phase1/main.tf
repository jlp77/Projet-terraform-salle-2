# Sous-réseaux publics (Web tier)
resource "aws_subnet" "web_public_zone_a" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.web_public_subnet_cidr_1
  map_public_ip_on_launch = true
  availability_zone       = var.zone_a
  tags = {
    Name = "web-public-zone-a"
  }
}

resource "aws_subnet" "web_public_zone_b" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.web_public_subnet_cidr_2
  map_public_ip_on_launch = true
  availability_zone       = var.zone_b
  tags = {
    Name = "web-public-zone-b"
  }
}

# Sous-réseaux privés (App tier)
resource "aws_subnet" "app_private_zone_a" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.app_private_subnet_cidr_1
  map_public_ip_on_launch = false
  availability_zone       = var.zone_a
  tags = {
    Name = "app-private-zone-a"
  }
}

resource "aws_subnet" "app_private_zone_b" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.app_private_subnet_cidr_2
  map_public_ip_on_launch = false
  availability_zone       = var.zone_b
  tags = {
    Name = "app-private-zone-b"
  }
}

# Sous-réseaux privés (DB tier)
resource "aws_subnet" "db_private_zone_a" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.db_private_subnet_cidr_1
  map_public_ip_on_launch = false
  availability_zone       = var.zone_a
  tags = {
    Name = "db-private-zone-a"
  }
}

resource "aws_subnet" "db_private_zone_b" {
  vpc_id                  = aws_vpc.ecosop-vpc.id
  cidr_block              = var.db_private_subnet_cidr_2
  map_public_ip_on_launch = false
  availability_zone       = var.zone_b
  tags = {
    Name = "db-private-zone-b"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ecosop-vpc.id
  tags = {
    Name = "internet-gateway"
  }
}

# Elastic IP pour NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "nat-eip"
  }
}

# NAT Gateway dans un subnet public
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.web_public_zone_a.id
  tags = {
    Name = "nat-gateway"
  }
  depends_on = [aws_internet_gateway.gw]  # Assure que IGW est créé en premier
}

# Table de routage publique (pour subnets publics)
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.ecosop-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "public-route-table"
  }
}

# Table de routage privée (pour subnets privés)
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.ecosop-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "private-route-table"
  }
}

# Associations des tables de routage
# Publics
resource "aws_route_table_association" "public_assoc_a" {
  subnet_id      = aws_subnet.web_public_zone_a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_assoc_b" {
  subnet_id      = aws_subnet.web_public_zone_b.id
  route_table_id = aws_route_table.public_route_table.id
}

# Privés App
resource "aws_route_table_association" "app_private_assoc_a" {
  subnet_id      = aws_subnet.app_private_zone_a.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "app_private_assoc_b" {
  subnet_id      = aws_subnet.app_private_zone_b.id
  route_table_id = aws_route_table.private_route_table.id
}

# Privés DB
resource "aws_route_table_association" "db_private_assoc_a" {
  subnet_id      = aws_subnet.db_private_zone_a.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "db_private_assoc_b" {
  subnet_id      = aws_subnet.db_private_zone_b.id
  route_table_id = aws_route_table.private_route_table.id
}