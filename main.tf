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
    region = "us-east-1"
    access_key = ""
    secret_key = ""
    profile    = "tf"
}

resource "aws_s3_bucket" "bucket_name" {
  bucket = "my-tf-test-bucket-23131244546557632"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Mangedbt    = "Terraform"
  }
}