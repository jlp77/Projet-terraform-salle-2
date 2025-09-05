variable "my_ip" {
  description = "Votre IP publique pour l'accès SSH au Bastion (ex. 'votre.ip/32')"
  type        = string
  default     = "0.0.0.0/0"  # Remplacez par votre IP réelle pour la sécurité !
}