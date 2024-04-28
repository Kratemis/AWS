variable "tags" {
    type = map(string)
    description = "A map of tags to add to all resources"
}

variable "account_id" {
    description = "The AWS account ID"
    type = string
}

variable "region" {
    description = "The AWS region"
    type = string
}
