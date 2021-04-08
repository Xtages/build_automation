variable "project_name" {}

variable "env" {}

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
