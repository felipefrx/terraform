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

resource "aws_s3_bucket" "bucket_name" {
  bucket = "my-tf-test-bucket-23131244546557632"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Mangedbt    = "Terraform"
  }
}
