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

variable "web_public_zone1" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "web_public_zone2" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.2.0/24"
}

variable "app-private-zone1" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.10.0/24"
}

variable "app-private-zone2" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.20.0/24"
}

variable "db-private-zone1" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.100.0/24"
}

variable "db-private-zone2" {
  description = "Bloc réseau public pour le VPC"
  type        = string
  default     = "10.0.200.0/24"
}