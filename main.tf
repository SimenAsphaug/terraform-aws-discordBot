resource "aws_iam_role" "discord_lambda_execution_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "discord_lambda_policy" {
  name = var.lambda_policy_name
  role = aws_iam_role.discord_lambda_execution_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "ec2:DescribeInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
        ]
        Resource = "*"
        Effect   = "Allow"
      },
    ]
  })
}

resource "aws_lambda_function" "discord_lambda" {
  filename         = var.lambda_filename
  function_name    = var.lambda_function_name
  role             = aws_iam_role.discord_lambda_execution_role.arn
  handler          = "index.handler"
  runtime          = var.lambda_runtime
  source_code_hash = filebase64sha256(var.lambda_filename)

  environment {
    variables = {
      PUBLIC_KEY = var.public_key
    }
  }
}

resource "aws_lambda_function_url" "discord_lambda_function_url" {
  function_name      = aws_lambda_function.discord_lambda.function_name
  authorization_type = "NONE"

  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}
