
resource "aws_codebuild_project" "codebuild_project" {
  name          = "${var.project_name}_${var.env}"
  description   = "CodeBuild project to build ${var.project_name}"
  build_timeout = "10"
  service_role  = var.service_role_arn
  badge_enabled = true

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = var.compute_type
    image                       = var.ecr_docker_img
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "SERVICE_ROLE"
    privileged_mode = var.privileged
  }

  logs_config {
    cloudwatch_logs {
      group_name  = var.cloudwatch_log_group_name
      stream_name = "${var.project_name}_${var.env}"
    }
  }

  vpc_config {
    vpc_id = data.terraform_remote_state.xtages.outputs.vpc_id
    subnets = data.terraform_remote_state.xtages.outputs.private_subnets
    security_group_ids = [aws_security_group.codebuild_default_sg.id]
  }

  source {
    type            = "GITHUB"
    location        = var.github_repo_url
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }

  source_version = var.github_branch

  tags = {
    Environment = var.env
    Terraform = true
  }
}

resource "aws_codebuild_source_credential" "github_prod_cred" {
  auth_type = "PERSONAL_ACCESS_TOKEN"
  server_type = "GITHUB"
  token = data.aws_ssm_parameter.github_token.value
}
