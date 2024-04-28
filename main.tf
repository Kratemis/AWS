# Get account_id with: data.aws_caller_identity.current.account_id
data "aws_caller_identity" "current" {}

module "step_function" {
  source = "./examples/step_function"

  region = var.region
  account_id = data.aws_caller_identity.current.account_id
  tags = {
    Example = "step_functions"
  }
}
