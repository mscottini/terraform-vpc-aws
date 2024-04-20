terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.46.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-vpc-aws-ms"
    key            = "terraform-vpc-aws/terraform.tfstate"
    dynamodb_table = "terraform-vpc-aws-lock"
    region         = "us-east-1"
  }

  required_version = "~> 1.7.4"
}

provider "aws" {
  region = "us-east-1"
}