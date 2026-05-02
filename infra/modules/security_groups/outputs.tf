output "alb_sg_id" {
  description = "The ID of the ALB Security Group"
  value       = aws_security_group.alb.id
}

output "ecs_sg_id" {
  description = "The ECS security group ID."
  value       = aws_security_group.ecs_tasks.id
}
