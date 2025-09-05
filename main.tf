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

module "phase1" {
  source = "./phase1"
}
module "phase2" {
  source = "./phase2"
}
module "phase3" {
  source = "./phase3"
}
module "phase4" {
  source = "./phase4"
}
module "phase5" {
  source = "./phase5"
}