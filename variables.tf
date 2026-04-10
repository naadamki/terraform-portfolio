variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Used to namespace all resources"
  type        = string
}

variable "environment" {
  description = "e.g. dev, prod"
  type        = string
  default     = "prod"
}
