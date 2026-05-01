variable "project_name" {
  type        = string
  description = "The name of the project, used for resource naming and tagging."
}

variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)"
}

variable "container_image" {
  type        = string
  description = "The latest container image for the app from AWS ECR."
}

variable "cpu" {
  type        = number
  description = "The unit of CPU that the task definition needs."
}

variable "memory" {
  type        = number
  description = "The unit of memory that the task definition needs."
}

variable "task_role_arn" {
  type        = string
  description = "The IAM role for allowing container task to call other AWS services."
}

variable "execution_role_arn" {
  type        = string
  description = "The IAM role for the ECS container agent and Docker deamon."
}

variable "db_secret" {
  type        = string
  description = "The RDS database secret for PostgreSQL."
}

variable "aws_region" {
  type        = string
  description = "The AWS region of where the resources are deployed."
}

variable "cloudwatch_log_group_name" {
  description = "The CloudWatch log group name for container logs."
  type        = string
}

variable "desired_count" {
  description = "The number of tasks being run in the ECS Service."
  type        = number
}

variable "alb_target_group" {
  description = "The ALB target group that the ECS service registers with."
}

variable "container_port" {
  description = "The port the container listens on."
  type        = number
  default     = 3000
}

variable "container_name" {
  type        = string
  description = "The name of the ECS container: defaults to project name below."
  default     = "${var.project_name}-container"
}
