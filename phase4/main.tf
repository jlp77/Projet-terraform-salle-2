# Subnet Group pour la base RDS
resource "aws_db_subnet_group" "ecoshop_db_subnet_group" {
  name       = "ecoshop-db-subnet-group"
  subnet_ids = var.db_private_subnet_ids

  tags = {
    Name = "ecoshop-db-subnet-group"
  }
}

# Instance RDS MySQL
resource "aws_db_instance" "ecoshop_rds" {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  identifier             = "ecoshop-rds"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  multi_az               = true
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.ecoshop_db_subnet_group.name
  vpc_security_group_ids = [var.sg_db_id]

  tags = {
    Name = "ecoshop-rds"
  }
}