resource "aws_s3_bucket" "project_s3" {
  bucket = "bucket-iti-wael"

  tags = {
    Name        = "Project Bucket"
    Environment = "Project"
  }
}
