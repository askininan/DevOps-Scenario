terraform {
  backend "s3" {
    bucket = "terraform-statefiles-devops-scenario"
    key    = "ecr-terraform.tfstate"
    region = "eu-central-1"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_ecr_repository" "devopsscenario-ecr-repo" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}