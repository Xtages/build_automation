
data "aws_ssm_parameter" "github_token" {
  name = "/codebuild/matias/token"
  with_decryption = true
}

data "terraform_remote_state" "xtages" {
  backend = "s3"
  config = {
    bucket = "xtages-tfstate"
    key    = "tfstate/us-east-1/production"
    region = "us-east-1"
  }
}
