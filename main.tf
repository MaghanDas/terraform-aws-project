# main.tf - Start with terraform basics.

terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }

  backend "local" {
  } # we will use s3 backend later.
}

provider "aws" {
  region = var.aws_region
}
# Use VPC Module in Root main.tf
# Go back to the root folder and edit main.tf to call the module:
module "vpc" {
  source              = "./modules/vpc"
  project_name        = var.project_name
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  availability_zone   = var.availability_zone
}

# using ec2 module..
module "ec2" {
  source           = "./modules/ec2"
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.public_subnet_id
  ami_id           = "ami-04e601abe3e1a910f" # ✅ Ubuntu 22.04 (eu-central-1)
  public_key_path  = "~/.ssh/terraform-key.pub"
}


# Code	Meaning
# terraform block	Specifies Terraform version and required providers
# required_providers	Tells Terraform to use the official AWS provider
# backend "local"	Temporarily stores Terraform state locally (we’ll switch to S3 later)
# provider "aws"	Sets the AWS region based on a variable