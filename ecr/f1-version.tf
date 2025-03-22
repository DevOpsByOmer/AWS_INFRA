terraform {
  required_version = "~>1.1"
  required_providers {
    aws = "~> 5.0"
  }
  backend "s3" {
    bucket         = "tf-backup-state115"
    key            = "ecr/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
provider "aws" {

  region = "ap-south-1"

}

