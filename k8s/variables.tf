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

variable "image_uri" {
  type = string
  default = ""
}