# S3 Bucket
resource "aws_s3_bucket" "ecommerce_bucket" {
  bucket = "ecommerce-${lower(random_string.suffix.result)}"

  tags = {
    Name        = "EcommerceStaticBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "ecommerce_bucket_website" {
  bucket = aws_s3_bucket.ecommerce_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "ecommerce_bucket_policy" {
  bucket = aws_s3_bucket.ecommerce_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.ecommerce_bucket.arn}/*"
      }
    ]
  })
}
