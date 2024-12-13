provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "data_bucket" {
  bucket = var.s3_bucket_name
  acl    = "private"
}

resource "aws_glue_job" "etl_job" {
  name     = var.glue_job_name
  role_arn = aws_iam_role.glue_service_role.arn
  command {
    name            = "glueetl"
    script_location = "s3://path-to-your-glue-script"
  }
}

resource "aws_sagemaker_model" "ml_model" {
  name     = var.sagemaker_model_name
  primary_container {
    image       = "123456789012.dkr.ecr.us-east-1.amazonaws.com/my-image:latest"
    environment = {
      "key" = "value"
    }
  }
}

resource "aws_athena_database" "athena_db" {
  name   = "ai_database"
  bucket = aws_s3_bucket.data_bucket.bucket
}

resource "aws_stepfunctions_state_machine" "ai_pipeline" {
  name = "AIDataPipeline"
  definition = jsonencode({
    StartAt = "Step1",
    States = {
      Step1 = {
        Type     = "Task",
        Resource = "arn:aws:lambda:us-east-1:123456789012:function:process-data",
        End      = true
      }
    }
  })
}
