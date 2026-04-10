variable "project_name" {
  description = "Used to namespace all resources"
  type        = string
}

variable "environment" {
  description = "e.g. dev, prod"
  type        = string
  default     = "prod"
}
