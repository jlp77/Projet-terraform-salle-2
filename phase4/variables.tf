# Liste des subnets privés pour la base de données
variable "db_private_subnet_ids" {
  description = "Liste des IDs des subnets privés pour RDS"
  type        = list(string)
}

# Nom de la base MySQL
variable "db_name" {
  description = "Nom de la base de données MySQL"
  type        = string
  default     = "ecoshop"
}

# Utilisateur admin de la base
variable "db_username" {
  description = "Nom de l’utilisateur admin de la base"
  type        = string
  default     = "admin"
}

# Mot de passe de la base
variable "db_password" {
  description = "Mot de passe admin pour la base RDS"
  type        = string
  sensitive   = true
  default     = "EcoShop2024!"
}

# Security Group RDS
variable "sg_db_id" {
  description = "ID du Security Group pour la base RDS"
  type        = string
}