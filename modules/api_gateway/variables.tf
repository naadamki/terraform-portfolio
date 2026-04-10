variable "project_name" {
  description = "Used to namespace all resources"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "Invoke ARN of the Lambda function"
  type        = string
}

variable "lambda_function_name" {
  description = "Name of the Lambda function (for permission resource)"
  type        = string
}
