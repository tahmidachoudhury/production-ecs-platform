output "target_group_arn" {
  description = "The ALB target group that the ECS service registers with."
  value       = aws_lb_target_group.app.arn
}
