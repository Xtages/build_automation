resource "aws_cloudwatch_log_group" "codebuild_log_group" {
  name = "codebuild-${var.app}-${var.env}"
  retention_in_days = 14
}
