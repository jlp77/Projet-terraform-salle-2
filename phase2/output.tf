# Outputs pour utilisation dans les phases suivantes (ex. pour attacher aux instances)
output "sg_web_id" {
  value = aws_security_group.sg_web.id
}

output "sg_app_id" {
  value = aws_security_group.sg_app.id
}

output "sg_db_id" {
  value = aws_security_group.sg_db.id
}

output "sg_bastion_id" {
  value = aws_security_group.sg_bastion.id
}