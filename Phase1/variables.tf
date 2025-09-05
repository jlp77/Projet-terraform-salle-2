# Région
variable "region" {
  description = "Zone AWS"
  type        = string
  default     = "us-east-1"
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

# CONFIGURATION VPC
variable "vpc_cidr" {
  description = "Bloc réseau pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "web_public_subnet_cidr_1" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "web_public_subnet_cidr_2" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.2.0/24"
}

variable "app_private_subnet_cidr_1" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.10.0/24"
}

variable "app_private_subnet_cidr_2" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.20.0/24"
}

variable "db_private_subnet_cidr_1" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.100.0/24"
}

variable "db_private_subnet_cidr_2" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.200.0/24"
}