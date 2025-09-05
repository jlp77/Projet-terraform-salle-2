
# Bastion Host
resource "aws_security_group" "sg_bastion" {
	name        = "SG-Bastion"
	description = "Accès SSH pour Bastion Host"
	vpc_id      = var.vpc_id

	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		cidr_blocks = [var.my_ip]
	}

	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "bastion" {
	ami           = var.ami_bastion
	instance_type = "t3.micro"
	subnet_id     = var.public_subnet_id
	key_name      = var.bastion_ssh_key
	vpc_security_group_ids = [aws_security_group.sg_bastion.id]
	tags = {
		Name = "Bastion-Host"
	}
}

# Serveurs Web/App
resource "aws_security_group" "sg_app" {
	name        = "SG-App"
	description = "Accès HTTP et SSH via Bastion"
	vpc_id      = var.vpc_id

	ingress {
		from_port   = 80
		to_port     = 80
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress {
		from_port   = 22
		to_port     = 22
		protocol    = "tcp"
		security_groups = [aws_security_group.sg_bastion.id]
	}
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_instance" "webapp" {
	count         = 2
	ami           = var.ami_webapp
	instance_type = "t3.small"
	subnet_id     = element(var.private_subnet_ids, count.index)
	key_name      = var.bastion_ssh_key
	vpc_security_group_ids = [aws_security_group.sg_app.id]
	user_data     = <<-EOF
		#!/bin/bash
		yum update -y
		yum install -y httpd php mysql
		systemctl start httpd
		systemctl enable httpd
		echo "" > /var/www/html/index.php
		echo "Server: $(hostname)" >> /var/www/html/index.php
	EOF
	tags = {
		Name = "WebApp-${count.index + 1}"
	}
}
