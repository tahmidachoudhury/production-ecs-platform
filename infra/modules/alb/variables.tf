variable "project_name" {
  type        = string
  description = "The name of the project, used for resource naming and tagging."
}

variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)."
}

variable "alb_sg_id" {
  type        = string
  description = "The ID of the ALB Security Group"
}

variable "aws_public_subnet_id" {
  type        = string
  description = "The ID of AWS public subnet"
}
