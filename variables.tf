#Variables pour la localisation
variable "location" {
  description = "Région Azure où déployer les ressources"
  type        = string
}

# CONFIGURATION VPC
variable "vpc_cidr" {
  description = "Bloc réseau pour le VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.1.0/24"
}