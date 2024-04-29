output "ScheduleTargetFunction" {
  value = module.scheduled_lambda.lambda_function_arn
  description = "The ARN of the Lambda function being invoked from EventBridge Scheduler"
}

output "ScheduleName" {
  value = aws_scheduler_schedule.invoke_lambda_schedule.name
  description = "Name of the EventBridge Schedule"
}