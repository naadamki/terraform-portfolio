# DynamoDB table — free tier: 25 GB storage, 200M requests/month
resource "aws_dynamodb_table" "counter" {
  name         = "${var.project_name}-visitor-counter"
  billing_mode = "PAY_PER_REQUEST"  # Free tier covers this easily
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = { Project = var.project_name }
}

# Zip the Lambda source automatically
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.root}/lambda_src/counter.py"
  output_path = "${path.module}/counter.zip"
}

# IAM role for Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "${var.project_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

# Least-privilege policy — only what Lambda needs
resource "aws_iam_role_policy" "lambda_dynamodb" {
  role = aws_iam_role.lambda_exec.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["dynamodb:UpdateItem", "dynamodb:GetItem"]
      Resource = aws_dynamodb_table.counter.arn
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda function — free tier: 1M requests/month + 400K GB-seconds
resource "aws_lambda_function" "counter" {
  function_name    = "${var.project_name}-visitor-counter"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "counter.handler"
  runtime          = "python3.12"
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.counter.name
    }
  }

  tags = { Project = var.project_name }
}
