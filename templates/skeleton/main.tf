provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "my-terraform-backend"
    key            = "aws/sqs/production-account/${{ values.name }}/terraform.tfstate"
    region         = "us-east-1"
    }
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  name = "FilaDo${{ values.name }}"

  create_dlq = ${{ values.create_dlq }}

  {%- if values.create_dlq %}
  redrive_policy = {
    # default is 5 for this module
    maxReceiveCount = 10
  }
  {%- endif %}

  tags = {
    Company = "${{ values.company }}",
  }
}
