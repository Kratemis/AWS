resource "aws_sfn_state_machine" "example_step_function" {
  name     = "hello-world-step-function"
  role_arn = aws_iam_role.step_function_role.arn

  definition = <<EOF
{
  "Comment": "A workflow to check if a number is even or odd and return a message.",
  "StartAt": "Check Number",
  "States": {
    "Check Number": {
      "Type": "Task",
      "Resource": "${module.check_number.lambda_function_arn}",
      "Next": "Generate Message"
    },
    "Generate Message": {
      "Type": "Task",
      "Resource": "${module.generate_message.lambda_function_arn}",
      "End": true
    }
  }
}
EOF
}
