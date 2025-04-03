terraform {
  backend "s3" {
    bucket         = "my-terraform-bucket"
    key            = "ec2-instance/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
