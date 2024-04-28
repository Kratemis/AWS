module "check_number" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "check-number"
  description   = "Check if number is even or odd."
  handler       = "main.lambda_handler"
  runtime       = "python3.8"

  source_path = "${path.module}/lambda-code/01-check-number"

  tags = var.tags
}

module "generate_message" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "generate-message"
  description   = "Generate message based on number."
  handler       = "main.lambda_handler"
  runtime       = "python3.8"

  source_path = "${path.module}/lambda-code/02-generate-message"

  tags = var.tags
}