# Subnets publics (Web)
variable "web_public_subnet_cidr_1" {
  description = "Bloc CIDR pour le premier subnet public Web"
  type        = string
  default     = "10.0.1.0/24"
}

variable "web_public_subnet_cidr_2" {
  description = "Bloc CIDR pour le deuxième subnet public Web"
  type        = string
  default     = "10.0.2.0/24"
}

# Subnets privés (App)
variable "app_private_subnet_cidr_1" {
  description = "Bloc CIDR pour le premier subnet privé App"
  type        = string
  default     = "10.0.10.0/24"
}

variable "app_private_subnet_cidr_2" {
  description = "Bloc CIDR pour le deuxième subnet privé App"
  type        = string
  default     = "10.0.20.0/24"
}

# Subnets privés (DB)
variable "db_private_subnet_cidr_1" {
  description = "Bloc CIDR pour le premier subnet privé DB"
  type        = string
  default     = "10.0.100.0/24"
}

variable "db_private_subnet_cidr_2" {
  description = "Bloc CIDR pour le deuxième subnet privé DB"
  type        = string
  default     = "10.0.200.0/24"
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

# Configuration VPC
variable "vpc_cidr" {
  description = "Bloc CIDR pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}