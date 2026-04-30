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

variable "public_subnets" {
  type        = list(string)
  description = "The list of public subnets for the ALBs"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where SGs will be created"
}
