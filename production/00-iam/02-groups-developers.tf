####################################################################
#                          read_only_accesss Group                        #
####################################################################
resource "aws_iam_group" "read_only_access" {
  name = "ReadOnlyAccess"
  path = "/"
}

resource "aws_iam_group_membership" "read_only_accesss_membership" {
  name = "read-only-accesss-membership"
  users = [
  ]

  group = aws_iam_group.read_only_access.name
}


data "aws_iam_policy" "read_only_access" {
  arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "read_only_access-attach" {
  policy_arn = data.aws_iam_policy.read_only_access.arn
  group      = aws_iam_group.read_only_access.name
}