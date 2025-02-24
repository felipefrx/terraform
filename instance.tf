terraform {
    required_version = "0.14.4"
    required_providers {
        aws {
            source = "hashicorp/aws"
            version = "3.23.0"
        }
    }
}

provider "aws" {
    region = var.aws_region
    access_key = ""
    secret_key = ""
    profile    = ""
}

resource "aws_instance" "web" {
  ami = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags
}