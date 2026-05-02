variable "project_name" {
  type        = string
  description = "The name of the project, used for resource naming and tagging."
}

variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)"
}

variable "log_retention_days" {
  type        = number
  description = "Specified the amount of days that logs events are kept in this log group."
  default     = 7
}
