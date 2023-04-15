output "public_ip" {
  value = aws_instance.ec2.public_ip
}
output "key-pair-name" {
  value = var.key_name
}

output "name" {
  value = aws_instance.ec2.user_data.name
}