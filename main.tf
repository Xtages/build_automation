//module "build_automation" {
//  source = "./modules/codebuild_project"
//  project_name = "build_automation"
//  ecr_docker_img = "606626603369.dkr.ecr.us-east-1.amazonaws.com/xtages-terraform:0.14.7"
//  env = var.env
//  github_repo_url = "https://github.com/Xtages/build_automation.git"
//  github_branch = "main"
//  service_role_arn = aws_iam_role.codebuild_role_terraform.arn
//}

module "tf_live_production" {
  source = "./modules/codebuild_project"
  project_name = "tf_live"
  ecr_docker_img = "606626603369.dkr.ecr.us-east-1.amazonaws.com/xtages-terraform:0.14.7"
  env = var.env
  github_repo_url = "https://github.com/Xtages/tf_live_production.git"
  github_branch = "build-automation"
  service_role_arn = aws_iam_role.codebuild_role_terraform.arn
}
