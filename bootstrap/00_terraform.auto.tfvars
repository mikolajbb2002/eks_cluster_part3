project_name  = "nginx-app"
environment   = "dev"
region        = "eu-central-1"
aws_profile   = "terraform-sso" # Use empty when using OIDC - terraform-sso
tags = {
  ManagedBy = "Terraform"
}
create_oidc_provider = false
oidc_provider_arn    = "arn:aws:iam::121935934245:oidc-provider/token.actions.githubusercontent.com"
oidc_manage_roles    = true
oidc_plan_role_arn    = ""
oidc_apply_role_arn   = ""
oidc_destroy_role_arn = ""
oidc_subjects = [
  "repo:mikolajbb2002/eks_cluster_part3:*",
  "repo:mikolajbb2002/eks_cluster_part3:pull_request"
]
