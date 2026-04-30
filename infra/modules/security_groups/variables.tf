variable "project_name" {
  type        = string
  description = "The name of the project, used for resource naming and tagging."
}

variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)."
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where SGs will be created"
}
