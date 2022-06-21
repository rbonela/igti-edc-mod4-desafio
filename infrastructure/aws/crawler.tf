resource "aws_glue_crawler" "glue_crawler" {
  database_name = "enade_db"
  name          = "enade_crawler"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3a://edc-mod4-processing-zone-774178677404/enade/"
  }

  tags = local.common_tags
}