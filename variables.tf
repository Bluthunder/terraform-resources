variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Machine Image ID"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}


variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "Miniproject-EC2"
}

variable "custom_port" {
  description = "Custom port to allow inbound traffic on"
  default     = 7001
}


variable "ssh_key_name" {
  description = "SSH Key Name"
  default = "private-key"
  
}