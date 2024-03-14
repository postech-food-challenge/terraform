provider "aws" {
  profile = "food-challenge-admin"
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}