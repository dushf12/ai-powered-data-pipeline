variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  default     = "ai-data-pipeline-bucket"
}

variable "glue_job_name" {
  description = "Glue job name"
  default     = "ai-glue-job"
}

variable "sagemaker_model_name" {
  description = "SageMaker model name"
  default     = "ai-model"
}
