terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
  }

  backend "s3" {
    bucket = "umami-ecs-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-2"
    encrypt = true

#   state locking set to true
    use_lockfile = true

    workspace_key_prefix = "umami-ecs-app"
  }
}

provider "aws" {
  region = "eu-west-2"
}