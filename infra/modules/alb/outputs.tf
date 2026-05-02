output "target_group_arn" {
  description = "The ALB target group that the ECS service registers with."
  value       = aws_lb_target_group.app.arn
}

output "dns_name" {
  value       = aws_lb.app.dns_name
  description = "DNS name of the load balancer."
}
