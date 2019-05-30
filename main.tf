# Terraform Main

module "dev-lambda" {
  source = "git::https://github.com/nalbam/terraform-aws-lambda-sns.git"
  region = var.region

  name        = var.name
  stage       = var.stage
  description = "sns > lambda > slack"
  runtime     = "nodejs8.10"
  handler     = "index.handler"
  memory_size = 512
  timeout     = 5
  s3_bucket   = var.s3_bucket
  s3_source   = "target/lambda.zip"
  s3_key      = "lambda/${var.name}/${var.name}.zip"

  env_vars = {
    PROFILE        = var.stage
    SLACK_HOOK_URL = var.SLACK_HOOK_URL
  }
}
