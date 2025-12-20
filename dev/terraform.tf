terraform {
  required_version = "= 1.5.7"

  backend "s3" {
    bucket  = "john-tenable-demo-bucket"
    key     = "test/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"

  assume_role {
    role_arn     = "arn:aws:iam::363934772033:role/Terraform-Execute"
    session_name = "terraform-session"
  }
}
