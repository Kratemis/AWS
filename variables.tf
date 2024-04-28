variable "terraform_state_bucket_name" {
    type = string
    description = "The name of the bucket to store the Terraform state file"
}

variable "region" {
    description = "The AWS region"
    type = string
}