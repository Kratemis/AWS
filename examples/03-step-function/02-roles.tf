resource "aws_iam_role" "step_function_role" {
  name = "step_function_role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : [
            "states.amazonaws.com"
          ]
        },
        "Action" : "sts:AssumeRole",
        "Condition" : {
          "ArnLike" : {
            "aws:SourceArn" : "arn:aws:states:${var.region}:${var.account_id}:stateMachine:*"
          },
          "StringEquals" : {
            "aws:SourceAccount" : "${var.account_id}"
          }
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_policy" "lambda_invoke" {
  name = "InvokeLambdaFunction"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "lambda:InvokeFunction"
        Resource = "arn:aws:lambda:${var.region}:${var.account_id}:function:*"
      },
    ]
  })
}

// Attach policy to IAM Role for Step Function
resource "aws_iam_role_policy_attachment" "iam_for_sfn_ec2" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
resource "aws_iam_role_policy_attachment" "iam_for_sfn_ssm" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_role_policy_attachment" "lambda_invoke_attachment" {
  role       = aws_iam_role.step_function_role.name
  policy_arn = aws_iam_policy.lambda_invoke.arn
}
