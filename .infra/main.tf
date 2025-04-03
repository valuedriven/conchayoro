resource "aws_s3_bucket" "cyo_bucket" {
  bucket = ${var.BUCKET_S3}
  tags = {
    Group       = "ci_cd"
  }
}

resource "aws_s3_bucket_ownership_controls" "cyo_bucket_oc" {
  bucket = aws_s3_bucket.cyo_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "cyo_bucket_ba" {
  depends_on = [aws_s3_bucket_ownership_controls.cyo_bucket_oc]

  bucket = aws_s3_bucket.cyo_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "cyo_bucket_policy" {
  bucket = aws_s3_bucket.cyo_bucket.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.BUCKET_S3}/*"
    }
  ]
}
POLICY
}
