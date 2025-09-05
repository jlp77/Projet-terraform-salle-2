# Projet Terraform - Infrastructure AWS

## Description
Ce projet implémente une infrastructure AWS complète avec Terraform, organisée en 5 phases modulaires pour déployer une application web sécurisée et haute disponibilité.

## Architecture

### Phase 1 : Infrastructure Réseau (VPC)
- **VPC** : `ecosop-vpc` (10.0.0.0/16)
- **Subnets Publics** : 2 AZ (10.0.1.0/24, 10.0.2.0/24)
- **Subnets Privés App** : 2 AZ (10.0.10.0/24, 10.0.20.0/24)  
- **Subnets Privés DB** : 2 AZ (10.0.100.0/24, 10.0.200.0/24)
- **Internet Gateway** + **NAT Gateway**
- **Tables de routage** configurées

### Phase 2 : Sécurité
- **Security Groups** :
  - `SG-Web` : Load Balancer (HTTP/HTTPS)
  - `SG-App` : Serveurs applicatifs (port 8080 + SSH via Bastion)
  - `SG-DB` : Base de données (MySQL port 3306)
  - `SG-Bastion` : Administration (SSH depuis IP autorisée)
- **Clé SSH** : Générée automatiquement avec Terraform (TLS provider)

### Phase 3 : Serveurs ✅ IMPLÉMENTÉ
- **Bastion Host** : 
  - Instance t3.micro dans subnet public
  - Clé SSH générée automatiquement
  - Security Group SG-Bastion
- **Serveurs Web/App** : 
  - 2 instances t3.small dans subnets privés (différentes AZ)
  - AMI Amazon Linux 2
  - User Data : Installation Apache, PHP, MySQL
  - Accès SSH uniquement via Bastion
  - Security Group SG-App

### Phase 4 : Base de Données
- RDS MySQL Multi-AZ
- Subnets privés dédiés
- Sauvegardes automatiques
- Security Group SG-DB

### Phase 5 : Load Balancer
- Application Load Balancer (ALB)
- Target Group avec health checks
- Répartition de charge sur les serveurs Web/App
- Security Group SG-Web

## Structure du Projet

```
├── main.tf              # Configuration principale et appel des modules
├── variables.tf         # Variables globales  
├── README.md           # Ce fichier
├── phase1/             # Infrastructure réseau
│   ├── main.tf
│   ├── variables.tf
│   └── output.tf
├── phase2/             # Sécurité et clés SSH
│   ├── main.tf
│   ├── variables.tf
│   └── output.tf
├── phase3/             # Serveurs (Bastion + Web/App) ✅
│   ├── main.tf
│   └── variables.tf    # Pas d'output.tf
├── phase4/             # Base de données
│   └── main.tf         # Pas de variables.tf ni output.tf
└── phase5/             # Load Balancer
    ├── main.tf
    └── variables.tf    # Pas d'output.tf
```

## Utilisation

### Prérequis
- Terraform >= 1.0
- AWS CLI configuré
- Droits d'administration AWS

### Déploiement

```bash
# Cloner le projet
git clone <url-du-repo>
cd Projet-terraform-salle-2

# Initialiser Terraform
terraform init

# Vérifier le plan
terraform plan

# Déployer l'infrastructure
terraform apply
```

### Variables à configurer

Les variables sont configurées via les fichiers `variables.tf` des modules avec des valeurs par défaut :

```hcl
# Variables principales avec valeurs par défaut dans les modules
region = "us-east-1"        # Région par défaut
my_ip  = "0.0.0.0/0"        # IP autorisée (⚠️ À restreindre en production)

# AMI configurées par défaut pour us-east-1 :
ami_bastion = "ami-0e95a5e2743ec9ec9"  # Bastion Host
ami_webapp  = "ami-0360c520857e3138f"  # Serveurs Web/App
```

## Accès et Connexion

### Accès au Bastion Host
```bash
# Utiliser la clé générée
ssh -i phase2/bastion-key.pem ec2-user@<BASTION_PUBLIC_IP>
```

### Accès aux Serveurs Web/App
```bash
# Via le Bastion (SSH tunneling)
ssh -i phase2/bastion-key.pem -J ec2-user@<BASTION_IP> ec2-user@<WEBAPP_PRIVATE_IP>
```

## Fonctionnalités Implémentées

✅ **Phase 1** : Infrastructure réseau VPC complète  
✅ **Phase 2** : Security Groups et génération automatique de clés SSH  
✅ **Phase 3** : Bastion Host + 2 serveurs Web/App avec User Data  
⏳ **Phase 4** : Base de données RDS (à implémenter)  
⏳ **Phase 5** : Load Balancer (à implémenter)  

## Sécurité

- **Principe de moindre privilège** : Chaque Security Group n'autorise que le trafic nécessaire
- **Bastion Host** : Seul point d'entrée SSH vers les serveurs privés
- **Clés SSH** : Générées automatiquement par Terraform avec chiffrement RSA 4096 bits
- **Isolation réseau** : Serveurs applicatifs dans des subnets privés

## Tests et Validation

### Vérifier le déploiement
```bash
# Les serveurs Web/App sont dans des subnets privés, pas d'IP publique directe
# Tester via Bastion Host

# Vérifier l'installation Apache via Bastion
ssh -i phase2/bastion-key.pem -J ec2-user@<BASTION_IP> ec2-user@<WEBAPP_PRIVATE_IP>
sudo systemctl status httpd
curl localhost  # Devrait afficher "Server: <hostname>"
```

## Nettoyage

```bash
# Détruire toute l'infrastructure
terraform destroy
```

## Auteur
Lucas, Mathéo, Jeremie, Julien, Sébastien - Projet Terraform AWS Infrastructure

---
