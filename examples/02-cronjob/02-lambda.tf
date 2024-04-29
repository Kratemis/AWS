module "scheduled_lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "scheduled_lambda"
  description   = "Scheduled Lambda function"
  handler       = "main.lambda_handler"
  runtime       = "python3.8"

  source_path = "${path.module}/lambda-code/01-scheduled-lambda"

  tags = var.tags
}