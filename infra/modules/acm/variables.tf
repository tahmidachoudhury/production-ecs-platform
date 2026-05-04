variable "project_name" {
  type        = string
  description = "The name of the project, used for resource naming and tagging."
}

variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)."
}

variable "subdomain_name" {
  type        = string
  description = "The subdomain name of the application from Route53."
}

variable "domain_name" {
  type        = string
  description = "The domain name of the application from Route53."
}

variable "alb_dns_name" {
  type        = string
  description = "This retrieves the ALB dns name to point to the Route53 subdomain."
}

variable "alb_zone_id" {
  type        = string
  description = "Retrieves the ALB zone id."
}

variable "validation_record_fqdns" {
  type        = list(string)
  description = "List of DNS record FQDNs used by ACM to verify domain ownership and complete certificate validation."
}
