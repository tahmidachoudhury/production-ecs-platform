output "target_group_arn" {
  description = "The ALB target group that the ECS service registers with."
  value       = aws_lb_target_group.app.arn
}

output "alb_dns_name" {
  value       = aws_lb.app.dns_name
  description = "DNS name of the load balancer."
}

output "alb_zone_id" {
  value       = aws_lb.app.zone_id
  description = "Zone ID of the load balancer."
}
