terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.2"
    }
  }
  required_version = ">= 0.15.0"
    backend "s3" {
    bucket = "felipec-state-files"
    key    = "v1cs/k8s/terraform.tfstate"
    region = "us-east-1"
    }
}

provider "aws" {
  region = var.aws_region
}
