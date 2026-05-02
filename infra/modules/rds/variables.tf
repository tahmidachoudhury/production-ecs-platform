variable "project_name" {
  type        = string
  description = "The name of the project, used for resource naming and tagging."
}

variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)"
}

variable "engine" {
  description = "The relational DB engine for RDS."
  type        = string
}

variable "engine_version" {
  description = "The version of the relational DB engine."
  type        = string
}

variable "instance" {
  description = "The instance type for the DB."
  type        = string
}

variable "storage_size" {
  description = "The allocated size for storage in GB."
  type        = number
}

variable "storage_type" {
  description = "The type of storage for the DB."
  type        = string
}

variable "private_subnet_ids" {
  description = "The private subnet IDs for the DB subnet group."
  type        = list(string)
}

variable "rds_sg_id" {
  type        = string
  description = "ID of the RDS security group to allow traffic on port 5432."
}
