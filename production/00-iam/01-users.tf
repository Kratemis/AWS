resource "aws_iam_user" "terraform" {
  name = "Terraform"
}

resource "aws_iam_user" "my_user" {
  name = "sergio"
}
