output "app_instance_public_ips" {
    description = "Public IP addresses of the app instances"
    value       = aws_instance.app[*].public_ip
}

output "app_instance_private_ips" {
    description = "Private IP addresses of the app instances"
    value       = aws_instance.app[*].private_ip
}

output "app_instance_ids" {
    description = "IDs of the app instances"
    value       = aws_instance.app[*].id
}