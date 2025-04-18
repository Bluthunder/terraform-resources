terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "ec2_sg" {

  name = "${var.instance_name}-sg"
  description = "Allow SSH, HTTP, HTTPS and custom port"
  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Custom Port"
    from_port   = var.custom_port
    to_port     = var.custom_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "${var.instance_name}-sg"
  }


  
}


resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = var.ssh_key_name
  public_key = tls_private_key.ssh.public_key_openssh

}

resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  user_data              = file("user_data.sh")
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  key_name               = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ssm_parameter" "ssh_private_key" {
  name        = "ec2-ssh-private-key"
  type        = "SecureString"
  value       = tls_private_key.ssh.private_key_pem
  description = "Private key to SSH into EC2 from GitHub Actions"
  overwrite   = true
}

output "ec2_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}


