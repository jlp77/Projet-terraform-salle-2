# Région
variable "region" {
  description = "Zone AWS"
  type        = string
  default     = "us-east-1"
}

# Configuration VPC
variable "vpc_cidr" {
  description = "Bloc CIDR pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "zone_a" {
  description = "Première zone de disponibilité"
  type        = string
  default     = "us-east-1a"
}

variable "zone_b" {
  description = "Deuxième zone de disponibilité"
  type        = string
  default     = "us-east-1b"
}

variable "vpc_id" {
  description = "ID du VPC"
  type        = string
  
}

variable "private_subnet_ids" {
  description = "Liste des IDs des subnets privés pour les serveurs Web/App"
  type        = list(string)
  
}