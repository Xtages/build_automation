resource "aws_security_group" "codebuild_default_sg" {
  vpc_id      = data.terraform_remote_state.xtages.outputs.vpc_id
  name        = "${var.env}-codebuild-sg"
  description = "CodeBuild default security group"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform = true
    Environment = var.env
  }
}
