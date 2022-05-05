output "s3-bucket" {
  value = aws_s3_bucket.bucket-terraform.bucket_domain_name
}