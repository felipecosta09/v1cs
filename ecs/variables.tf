# provider variable
variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
  default     = "us-east-1"
}

variable "image_uri" {
  description = "URI of the docker image"
  type        = string
  default     = ""
}

variable "prefix" {
  description = "Prefix for the resources"
  type        = string
  default     = "v1cs"
}