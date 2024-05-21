provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-backend"
    key            = "aws/sqs/production-account/Gabs/terraform.tfstate"
    region         = "us-east-1"
    }
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  name = "FilaDoGabs"

  create_dlq = true
  redrive_policy = {
    maxReceiveCount = 10
  }

  tags = {
    Company = "Slang",
  }
}
