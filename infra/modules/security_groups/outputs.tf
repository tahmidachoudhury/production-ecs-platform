output "alb_sg_id" {
  description = "The ALB security group ID."
  value       = aws_security_group.alb.id
}

output "ecs_sg_id" {
  description = "The ECS security group ID."
  value       = aws_security_group.ecs_tasks.id
}

output "rds_sg_id" {
  description = "The RDS security group ID."
  value       = aws_security_group.rds_psql.id
}
