output "execution_role_arn" {
  description = "The ARN of the ECS Task Execution Role"
  value       = aws_iam_role.ecs_task_execution_role.arn
  depends_on  = [aws_iam_role_policy.ecs_task_execution_secrets]
}

output "ecs_task_role_arn" {
  description = "The ARN of the ECS Task Role"
  value       = aws_iam_role.ecs_task_role.arn
}
