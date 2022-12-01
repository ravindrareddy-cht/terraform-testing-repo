terraform {
  required_version = ">= 0.13"

  backend "s3" {
    # bucket owned by cht env repo
    bucket         = "cht-terraform-ng-stg"
    key            = "cht-terraform-ng-stg/services/cht-svc-data-export/terraform.tfstate"
    dynamodb_table = "cht-terraform-ng-stg"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "null_resource" example {

}
