terraform {
  required_providers {
    aws = {
      version = "= 4.48.0"
    }
  }
}
provider "aws" {
  region = "us-east-2"
}
