# Get account_id with: data.aws_caller_identity.current.account_id
data "aws_caller_identity" "current" {}

################################################################
#                       ALWAYS ON MODULES                      #    
################################################################

module "iam" {
  source = "./production/00-iam"
  tags = {
    Production = "yes"
    Module     = "IAM"
  }
}

module "billing" {
  source = "./production/01-billing"
  tags = {
    Production = "yes"
    Module     = "Billing"
  }
}


################################################################
#                       OPTIONAL MODULES                       #
################################################################



# module "api" {
#   source = "./examples/01-api"
#   tags = {
#     Production = "no"
#     Example = "api"
#   }
# }

# module "cronjob" {
#   source = "./examples/02-cronjob"
#   tags = {
#     Production = "no"
#     Example = "cronjob"
#   }
# }

# module "step_function" {
#   source = "./examples/03-step-function"
#   region     = var.region
#   account_id = data.aws_caller_identity.current.account_id
#   tags = {
#     Production = "no"
#     Example    = "step_functions"
#   }
# }
