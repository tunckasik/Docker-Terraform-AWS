output "public_ip" {
  value = aws_instance.ec2.public_ip
}
output "ssh_connection" {
  value = "ssh -i ${var.ssh_private}"
}