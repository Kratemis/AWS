resource "random_string" "terraform_state_bucket_prefix" {
  # Each string should be 16 characters
  length = 5

  # Include alphanumeric characters, both upper and lower case
  upper   = false
  lower   = true
  numeric = false
  special = false
}


resource "aws_s3_bucket" "state_bucket" {
  bucket = "${var.terraform_state_bucket_name}-${random_string.terraform_state_bucket_prefix.result}"

  tags = {
    Name = "${var.terraform_state_bucket_name}-${random_string.terraform_state_bucket_prefix.result}"
    Use  = "State bucket"
  }

  lifecycle {
    prevent_destroy = true
  }
}
