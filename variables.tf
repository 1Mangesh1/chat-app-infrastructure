variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
}