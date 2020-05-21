[![Logo](https://dntsk.dev/assets/logo_transparent_crop_360.png)](https://dntsk.dev)

[![Maintained](https://img.shields.io/badge/maintained%20by-dntsk.dev-blue.svg)](https://dntsk.dev/) [![GitHub tag](https://img.shields.io/github/tag/dntsk/terraform-in-docker.svg)](https://github.com/dntsk/terraform-aws-lambda-packager/tags/) [![MIT license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

# Container image with Terraform

You can use this image with your drone.io CI/CD.

## Usage with Drone.io

```
---
kind: pipeline
name: terraform
type: docker

global-variables:
  image: &terraform_image dntskdev/terraform:0.12.25
  environment: &default_environment
    AWS_DEFAULT_REGION: us-east-1
    AWS_REGION: us-east-1
    AWS_SECRET_ACCESS_KEY:
      from_secret: AWS_SECRET_ACCESS_KEY
    AWS_ACCESS_KEY_ID:
      from_secret: AWS_ACCESS_KEY_ID

steps:
  - name: validate
    image: *terraform_image
    environment: *default_environment
    commands:
      - terraform init
      - terraform validate

  - name: plan
    image: *terraform_image
    environment: *default_environment
    commands:
      - terraform plan -out=current.tfplan

  - name: apply
    image: *terraform_image
    environment: *default_environment
    commands:
      - terraform apply "current.tfplan"
```
