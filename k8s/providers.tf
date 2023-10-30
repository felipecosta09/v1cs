terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.23.1"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
  required_version = ">= 0.15.0"
    backend "s3" {
    bucket = "felipe-state-files"
    key    = "v1cs/k8s/terraform.tfstate"
    region = "us-east-1"
    }
}

provider "aws" {
  region = var.aws_region
}
