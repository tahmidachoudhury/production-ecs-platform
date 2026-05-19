variable "project_name" {
  type        = string
  description = "The name of the project, used for resource naming and tagging."
}

variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)"
}

variable "db_secret_arn" {
  type        = string
  sensitive   = true
  description = "ARN of the Secrets Manager secret for RDS master credentials."
}
