# Output the VPC ID
output "vpc_id" {
    description = "ID of the VPC"
    value       = aws_vpc.main.id
}

# Output the public subnet IDs
output "public_subnet_ids" {
    description = "IDs of the public subnets"
    value       = aws_subnet.public[*].id
}

# Output the private subnet IDs
output "private_subnet_ids" {
    description = "IDs of the private subnets"
    value       = aws_subnet.private[*].id
}

# Output the bastion host public IP
output "bastion_public_ip" {
    description = "Public IP address of the bastion host"
    value       = aws_instance.bastion.public_ip
}