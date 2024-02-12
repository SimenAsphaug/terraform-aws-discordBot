Terraform Module: Discord Lambda
This Terraform module creates an AWS Lambda function integrated with Discord API Gateway for building Discord bots.

Features
Creates an AWS Lambda function
Sets up an IAM role and policy for Lambda execution
Configures environment variables, including the Discord bot's public key
Creates API Gateway integrations for invoking the Lambda function
Supports CORS configuration for the API Gateway endpoints
Usage
hcl
Copy code
module "discord_lambda" {
  source = "github.com/your-username/discord-lambda-module"

  lambda_function_name = "discord-bot-lambda"
  public_key           = "your-discord-bot-public-key"
  lambda_filename      = "path/to/your/lambda/code.zip"
  lambda_runtime       = "nodejs14.x"
  lambda_role_name     = "discord-lambda-role"
  lambda_policy_name   = "discord-lambda-policy"
  lambda_iam_actions   = [
    "logs:CreateLogGroup",
    "logs:CreateLogStream",
    "logs:PutLogEvents",
    "ec2:DescribeInstances",
    "ec2:StartInstances",
    "ec2:StopInstances",
  ]
}
Inputs
Name	Description	Type	Default	Required
lambda_function_name	Name of the Lambda function	string		Yes
public_key	Public key from the Discord bot	string		Yes
lambda_filename	Filename of the Lambda code ZIP file	string		Yes
lambda_runtime	Runtime for the Lambda function	string		Yes
lambda_role_name	Name of the IAM role for Lambda	string		Yes
lambda_policy_name	Name of the IAM policy for Lambda	string		Yes
lambda_iam_actions	List of IAM actions allowed for Lambda	list(string)		Yes
Outputs
Name	Description
lambda_function_arn	ARN of the created Lambda function
lambda_function_name	Name of the created Lambda function
lambda_invoke_url	URL for invoking the Lambda function
lambda_invoke_url_cors	URL for invoking the Lambda function with CORS enabled
License
This project is licensed under the MIT License - see the LICENSE file for details.

Feel free to customize this template to suit your specific module's functionality and usage instructions.
