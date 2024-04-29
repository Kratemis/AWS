module "api_gateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "~> 2.0"

  name          = "api-http"
  description   = "My awesome HTTP API Gateway"
  protocol_type = "HTTP"

  create_api_domain_name = false

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  integrations = {
    "ANY /" = {
      lambda_arn             = module.lambda_function.lambda_function_arn
      payload_format_version = "2.0"
    }
  }

  tags = var.tags
}
