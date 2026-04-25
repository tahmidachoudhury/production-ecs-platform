variable "project_name" {
  description = "The name of the project. Used as a prefix for all resource names."
  type        = string
  default     = "umami-ecs-app"
}

variable "environment" {
  description = "Deployment environment (dev, staging, or prod)."
  type        = string
}