terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
    archive = { source = "hashicorp/archive" }
  }
}

provider "aws" { region = "us-east-1" }

module "fn" {
  source        = "../../modules/aws/lambda-python"
  function_name = "hello-fn"
  entry_file    = "${path.module}/lambda_src/hello.py"
}

