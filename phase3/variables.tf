
variable "bastion_ssh_key" {
	description = "Nom de la clé SSH pour le Bastion Host"
	type        = string
}

variable "vpc_id" {
	description = "ID du VPC"
	type        = string
}

variable "my_ip" {
	description = "Adresse IP autorisée pour SSH sur le Bastion"
	type        = string
}

variable "ami_bastion" {
	description = "AMI pour le Bastion Host"
	type        = string
}

variable "public_subnet_id" {
	description = "ID du subnet public pour le Bastion Host"
	type        = string
}

variable "ami_webapp" {
	description = "AMI pour les serveurs Web/App (Amazon Linux 2)"
	type        = string
}

variable "private_subnet_ids" {
	description = "Liste des IDs des subnets privés pour les serveurs Web/App"
	type        = list(string)
}
