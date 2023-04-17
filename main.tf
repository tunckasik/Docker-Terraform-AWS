terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}

# Userdata
data "template_file" "userdata" {
  template = file("${abspath(path.module)}/userdata.sh")
}

# Instance
resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  # Keypair
  key_name = var.key_name #change the variable
  user_data = data.template_file.userdata.rendered
  vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  tags = {
    Name = var.instance_name
  }
}
# To be able to get output of the default user name
locals {
  ami_users = {
    "ami-04581fbf744a7d11f" = "ec2-user"
    "ami-0f607975b6c3b6d67" = "ubuntu"
    # Add more mappings if needed
  }
}
# Security Group Settings

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 38080
    to_port          = 38080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sc_name
  }
}
