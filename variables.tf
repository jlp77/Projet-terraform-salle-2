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

variable "zone_public" {
  description = "Zone publique"
  type        = string
  default     = "us-east-1a"
}

variable "zone_private" {
  description = "Zone privée"
  type        = string
  default     = "us-east-1b"
}