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