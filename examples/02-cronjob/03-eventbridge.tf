
resource "aws_scheduler_schedule" "invoke_lambda_schedule" {
  name = "InvokeLambdaSchedule"
  flexible_time_window {
    mode = "OFF"
  }
  schedule_expression = "rate(5 minute)"
  target {
  arn = module.scheduled_lambda.lambda_function_arn
    role_arn = aws_iam_role.scheduler_role.arn
    input = jsonencode({"input": "This message was sent using EventBridge Scheduler!"})
  }
}