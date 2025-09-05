variable "vpc_id" {
  description = "ID du VPC"
  type        = string
}

variable "web_public_subnet_ids" {
  description = "IDs des sous-réseaux publics WEB"
  type        = list(string)
}

variable "app_instance_ids" {
  description = "List of app server instance IDs"
  type        = list(string)
}

variable "sg_web_id" {
  description = "Security Group ID for ALB"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}