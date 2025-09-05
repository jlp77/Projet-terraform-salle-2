terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Use a recent version
    }
  }
}

# Provider AWS
provider "aws" {
  region = var.region
}

# Création du VPC
resource "aws_vpc" "ecosop-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "ecosop-vpc"
  }
}

module "phase1" {
  source = "./phase1"
}
module "phase2" {
  source = "./phase2"
}
module "phase3" {
  source = "./phase3"
  vpc_id = aws_vpc.ecosop-vpc.id
  private_subnet_ids = [ aws_subnet.app_private_zone_a.id, aws_subnet.app_private_zone_b.id ]
}
# module "phase4" {
#   source = "./phase4"
# }
# module "phase5" {
#   source = "./phase5"
# }