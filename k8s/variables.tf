variable "prefix" {
  type = string
  default = "v1cs"
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "ecr_repo_name" {
  type = string
  default = "563763293556.dkr.ecr.us-east-1.amazonaws.com/webapp"
}