data "aws_ssm_parameter" "github_token" {
  name = "/codebuild/matias/token"
  with_decryption = true
}

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
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = var.ecr_docker_img
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "codebuild-${var.env}"
      stream_name = "${var.project_name}_${var.env}"
    }
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
