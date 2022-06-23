resource "aws_glue_crawler" "glue_crawler" {
  database_name = "enade_db"
  name          = "enade_crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = var.bucket_paths
  }

  tags = local.common_tags
}