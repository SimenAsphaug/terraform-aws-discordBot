variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
  default     = "discord-bot"
}

variable "public_key" {
  description = "Public key from the Discord bot"
  type        = string
}

variable "lambda_filename" {
  description = "Filename of the Lambda function code ZIP file"
  type        = string
  default     = "discord.zip"
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "nodejs14.x"
}

variable "lambda_role_name" {
  description = "Name of the IAM role for Lambda execution"
  type        = string
  default     = "discord_lambda_execution_role"
}

variable "lambda_policy_name" {
  description = "Name of the IAM policy for Lambda execution"
  type        = string
  default     = "discord_lambda_execution_policy"
}
