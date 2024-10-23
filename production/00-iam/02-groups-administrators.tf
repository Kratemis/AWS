####################################################################
#                        Administrators Group                      #
####################################################################
resource "aws_iam_group" "administrators" {
  name = "Administrators"
  path = "/"
}

resource "aws_iam_group_membership" "administrators_membership" {
  name = "administrators-membership"

  users = [
    aws_iam_user.terraform.name,
    aws_iam_user.my_user.name
  ]

  group = aws_iam_group.administrators.name
}

data "aws_iam_policy" "administrator" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "administrator-attach" {
  policy_arn = data.aws_iam_policy.administrator.arn
  group      = aws_iam_group.administrators.name
}

