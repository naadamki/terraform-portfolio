output "lambda_invoke_arn" {
  value = aws_lambda_function.counter.invoke_arn
}

output "lambda_function_name" {
  value = aws_lambda_function.counter.function_name
}
