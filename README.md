# Build Automation

This repository leverage AWS CodeBuild to build and deploy our infrastructure.

There is a module to reuse the code as it will create a project as needed. Currently is used with:
- build_automation
- tf_live_production
- console

This same repository is added to CodeBuild so whenever there is a change we can apply the change using 
our automation without having to run it locally.

The project for build_automation was created first and later on the other projects were added

## How to add a new project?
- Create a new module for the project in `main.tf` providing all the parameters
- Make sure that the other GH project has a `buildspec.yml` file

## Improvements that can be done
- [ ] remove Matias GH token
- [ ] add retention policy to CloudWatch logs
