output "log_group_name" {
  description = "ARN of the CloudWatch Log Group resource."
  value       = aws_cloudwatch_log_group.ecs.name
}
