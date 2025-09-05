variable "vpc_id" {
  description = "VPC ID (assumed created in earlier phases)"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "app_instance_ids" {
  description = "List of app server instance IDs"
  type        = list(string)
}

variable "sg_web_id" {
  description = "Security Group ID for ALB (SG-Web)"
  type        = string
}