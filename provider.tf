terraform {
  required_version = ">1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0.0"
    }
  }
 # Define Terraform Backend for S3 and dynamodb table
  backend "s3" {
    bucket         = "rs-terraform-statefile01"
    key            = "terraform-statefile"
    region         = "ap-southeast-1"
    role_arn       = "arn:aws:iam::640111764884:role/stsassume-role"
    dynamodb_table = "rs-terraform-statetable"
  }
}

provider "aws" {
  region = "ap-southeast-1"
  assume_role {
    role_arn     = "arn:aws:iam::640111764884:role/stsassume-role"
    session_name = "terraform-sts"
  }
}
