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
