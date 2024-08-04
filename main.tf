terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.58"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6"
    }
  }
  backend "s3" {
    bucket         = "francis-dev-terraform-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region
}
