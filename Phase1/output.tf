output "vpc_id" {
  description = "ID du VPC"
  value       = aws_vpc.ecosop-vpc.id
}

output "web_public_subnet_ids" {
  description = "ID des sous réseaux public WEB"
  value       = [aws_subnet.web_public_zone_a.id, aws_subnet.web_public_zone_b.id]
}

output "app_private_subnet_ids" {
  description = "ID des sous réseaus privés APP"
  value       = [aws_subnet.app_private_zone_a.id, aws_subnet.app_private_zone_b.id]
}

output "db_private_subnet_ids" {
  description = "ID des sous réseaux privés DB"
  value       = [aws_subnet.db_private_zone_a.id, aws_subnet.db_private_zone_b.id]
}

output "internet_gateway_id" {
  description = "ID de la gateway internet"
  value       = aws_internet_gateway.gw.id
}

output "nat_gateway_id" {
  description = "ID de la gateway NAT"
  value       = aws_nat_gateway.nat_gw.id
}

output "nat_gateway_public_ip" {
  description = "IP publique de la gateway NAT"
  value       = aws_eip.nat_eip.public_ip
}

output "public_route_table_id" {
  description = "ID de la tableau de routage publique"
  value       = aws_route_table.public_route_table.id
}

output "private_route_table_id" {
  description = "ID de la table de routage privée"
  value       = aws_route_table.private_route_table.id
}