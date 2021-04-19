# Automation for this repository
module "build_automation" {
  source = "./modules/codebuild_project"
  project_name = "build_automation"
  ecr_docker_img = "606626603369.dkr.ecr.us-east-1.amazonaws.com/xtages-terraform:0.14.7"
  env = var.env
  github_repo_url = "https://github.com/Xtages/build_automation.git"
  github_branch = "main"
  service_role_arn = aws_iam_role.codebuild_role_terraform.arn
  cloudwatch_log_group_name = aws_cloudwatch_log_group.codebuild_log_group.name
  codebuild_sg = [aws_security_group.codebuild_default_sg.id]
}

# Automation for tf_live_production repository
module "tf_live_production" {
  source = "./modules/codebuild_project"
  project_name = "tf_live"
  ecr_docker_img = "606626603369.dkr.ecr.us-east-1.amazonaws.com/xtages-terraform:0.14.7"
  env = var.env
  github_repo_url = "https://github.com/Xtages/tf_live_production.git"
  github_branch = "main"
  service_role_arn = aws_iam_role.codebuild_role_terraform.arn
  cloudwatch_log_group_name = aws_cloudwatch_log_group.codebuild_log_group.name
  codebuild_sg = [aws_security_group.codebuild_default_sg.id]
}

# Automation for console repository
module "console" {
  source = "./modules/codebuild_project"
  project_name = "console"
  ecr_docker_img = "606626603369.dkr.ecr.us-east-1.amazonaws.com/xtages-buildenv:0.1.0"
  env = var.env
  privileged = true
  compute_type = "BUILD_GENERAL1_MEDIUM"
  github_repo_url = "https://github.com/Xtages/console.git"
  github_branch = "main"
  service_role_arn = aws_iam_role.codebuild_role_terraform.arn
  cloudwatch_log_group_name = aws_cloudwatch_log_group.codebuild_log_group.name
  codebuild_sg = [aws_security_group.codebuild_default_sg.id]
}
