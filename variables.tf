# Région
variable "region" {
  description = "Zone AWS"
  type        = string
  default     = "us-east-1"
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
