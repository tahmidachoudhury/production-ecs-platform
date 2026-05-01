variable "project_name" {
  type        = string
  description = "The name of the project, used for resource naming and tagging."
}

variable "environment" {
  type        = string
  description = "The deployment environment (dev or prod)."
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository."
  type        = string
  # OPTIONS: MUTABLE, IMMUTABLE, IMMUTABLE_WITH_EXCLUSION, or MUTABLE_WITH_EXCLUSION
  default = "IMMUTABLE_WITH_EXCLUSION"
}
