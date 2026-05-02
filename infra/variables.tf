variable "project_name" {
  description = "The name of the project. Used as a prefix for all resource names."
  type        = string
  default     = "umami-ecs-app"
}

variable "environment" {
  description = "Deployment environment (dev, staging, or prod)."
  type        = string
}

variable "aws_region" {
  type        = string
  description = "The AWS region of where the resources are deployed."
  default     = "eu-west-2"
}

locals {
  container_name = "${var.project_name}-container"
}

variable "container_image" {
  description = "Full ECR image URI for the backend container."
  type        = string
}
