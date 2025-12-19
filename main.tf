terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.15.1"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "TestVM" {

  ami                         = var.image_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Owner      = "shrikant-iac",
    Name       = "Test VM"
    Department = "Product Management"
    Lifecycle  = "2021/05/20"
    Email      = "sdhanawade@qualys.com"
  }
}
