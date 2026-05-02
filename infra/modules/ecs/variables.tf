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

variable "db_secret_arn" {
  type        = string
  description = "The RDS database secret from AWS Secrets Manager."
}

variable "aws_region" {
  type        = string
  description = "The AWS region of where the resources are deployed."
}

variable "cloudwatch_log_group_name" {
  description = "The CloudWatch log group name for container logs."
  type        = string
}

variable "number_of_tasks" {
  description = "The number of tasks being run in the ECS Service."
  type        = number
}

variable "alb_target_group_arn" {
  description = "The ALB target group that the ECS service registers with."
  type        = string
}

variable "container_port" {
  description = "The port the container listens on."
  type        = number
}

variable "container_name" {
  type        = string
  description = "The name of the ECS container: defaults to project name."
}

variable "ecs_sg_id" {
  type        = string
  description = "The ECS security group."
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs where ECS tasks will run."
  type        = list(string)
}
