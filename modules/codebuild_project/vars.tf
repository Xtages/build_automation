variable "project_name" {}

variable "env" {}

variable "cloudwatch_log_group_name" {}

variable "service_role_arn" {
  description = "Service Role used by CodeBuild"
}

variable "ecr_docker_img" {
  description = "Docker image from ECR to run the build"
}

variable "github_repo_url" {
  description = "HTTPS URL to the GH repo"
}

variable "github_branch" {
  default = "main"
  description = "Branch in GH used to pull the code"
}

variable "compute_type" {
  default = "BUILD_GENERAL1_SMALL"
}

variable "privileged" {
  default = false
}
