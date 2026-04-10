terraform {
  required_version = ">= 1.6.0"

  cloud {
    organization = "naadamki"  # from Terraform Cloud
    workspaces {
      name = "terraform-portfolio"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
