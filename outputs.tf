output "public_ip" {
  value = aws_instance.ec2.public_ip
}
output "key-pair-name" {
  value = var.key_name
}

output "default_user" {
  value = local.ami_users[aws_instance.ec2.ami]
}