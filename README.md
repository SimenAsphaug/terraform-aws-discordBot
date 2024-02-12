# Terraform Module: Discord Lambda

This Terraform module creates an AWS Lambda function integrated with Discord API Gateway for building Discord bots.

## Features

- Creates an AWS Lambda function
- Sets up an IAM role and policy for Lambda execution
- Configures environment variables, including the Discord bot's public key
- Creates API Gateway integrations for invoking the Lambda function
- Supports CORS configuration for the API Gateway endpoints

## Usage

```hcl
module "discord_lambda" {
  source = "github.com/your-username/discord-lambda-module"

  lambda_function_name = "discord-bot-lambda"
  public_key           = "your-discord-bot-public-key"
  lambda_filename      = "path/to/your/lambda/code.zip"
  lambda_runtime       = "nodejs14.x"
  lambda_role_name     = "discord-lambda-role"
  lambda_policy_name   = "discord-lambda-policy"
  ]
}
