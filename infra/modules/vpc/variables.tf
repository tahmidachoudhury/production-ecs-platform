variable project_name {
    type = string
    description = "The name of the project, used for resource naming and tagging."
}

variable "environment" {
    type = string
    description = "The deployment environment (dev or prod)"
}

variable "public_subnet_cidr" {
    type = list(string)
    description = "List of CIDR blocks for the public subnets."
    default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "private_subnet_cidr" {
    type = list(string)
    description = "List of CIDR blocks for the private subnets."
    default = [ "10.0.10.0/24", "10.0.11.0/24" ]
}

variable "availability_zone" {
  type = list(string)
  description = "AWS availaibility zones to distribute subnets for infrastructure resiliency."
  default = [ "eu-west-2a", "eu-west-2b" ]
}