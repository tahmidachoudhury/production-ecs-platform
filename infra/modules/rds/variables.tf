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
