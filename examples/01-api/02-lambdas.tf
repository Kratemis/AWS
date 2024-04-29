
module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~> 4.0"

  function_name = "hello-world-lambda"
  description   = "Hello world lambda function"
  handler       = "main.lambda_handler"
  runtime       = "python3.8"
  publish       = true

  source_path = "${path.module}/lambda-code/01-hello-world-endpoint"

  allowed_triggers = {
    AllowExecutionFromAPIGateway = {
      service    = "apigateway"
      source_arn = "${module.api_gateway.apigatewayv2_api_execution_arn}/*/*"
    }
  }

  tags =  var.tags
}