output "s3_bucket_name" {
  value = aws_s3_bucket.data_bucket.id
}

output "glue_job_arn" {
  value = aws_glue_job.etl_job.arn
}

output "sagemaker_model_name" {
  value = aws_sagemaker_model.ml_model.name
}

