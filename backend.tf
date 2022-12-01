terraform {

  required_version = ">= 0.13"

  backend "s3" {
    # bucket is used for atlantis
    bucket         = "cht-terraform-mgmt"
    key            = "cht-terraform-mgmt/dummy_test/terraform.tfstate"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}