terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.17"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.region
  
}

module "oidc" {
  source        = "../Dev/modules/oidc"
  project_name  = var.project_name
  environment   = var.environment
  region        = var.region
  tags          = var.tags
  create_oidc_provider = var.create_oidc_provider
  oidc_provider_arn    = var.oidc_provider_arn
  manage_roles        = var.oidc_manage_roles
  existing_plan_role_arn   = var.oidc_plan_role_arn
  existing_apply_role_arn  = var.oidc_apply_role_arn
  existing_destroy_role_arn = var.oidc_destroy_role_arn
  oidc_subjects        = var.oidc_subjects
}
