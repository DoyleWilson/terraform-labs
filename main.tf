terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region     = var.aws-region
  access_key = "AKIATEWESVHREUDR6Y6H"
  secret_key = "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"
}

provider "github" {
  # Configuration options
  token = "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"
}

resource "github_repository" "terraform-labs" {
  name       = "terraform-labss"
  visibility = "private"
}

/*
module "ec2" {
  ec2_instance_type = var.ec2_instance_type
  is_required       = var.is_required
  source            = "./module-ec2"
}

module "s3" {
  source = "./module-s3"
}*/

module "provisioner-remote" {
  source = "./module-provisioners"
}