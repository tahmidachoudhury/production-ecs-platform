output "alb_url" {
  value       = module.alb.dns_name
  description = "DNS name of the load balancer."
}
