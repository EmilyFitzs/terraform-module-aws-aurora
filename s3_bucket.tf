resource "aws_s3_bucket" "dms_target_bucket" {
  bucket = "my-dms-target-bucket-${var.cluster_identifier}"

  tags = {
    Name        = "My DMS Target Bucket"
    Environment = "production"
  }
}