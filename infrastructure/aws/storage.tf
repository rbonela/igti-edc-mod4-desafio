resource "aws_s3_bucket" "buckets" {
  count  = length(var.bucket_names)
  bucket = "${local.prefix}-${var.bucket_names[count.index]}-${var.account}"
  tags   = local.common_tags
}

resource "aws_s3_bucket_acl" "acl_privacy" {
  count  = length(var.bucket_names)
  bucket = aws_s3_bucket.buckets[count.index].id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_encryption" {
  count  = length(var.bucket_names)
  bucket = aws_s3_bucket.buckets[count.index].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
