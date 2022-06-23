resource "aws_s3_object" "dados_enade" {
  bucket = aws_s3_bucket.buckets[0].id
  key    = "enade/2017/MICRODADOS_ENADE_2017"
  acl    = "private" # or can be "public-read"
  source = "../../dados/MICRODADOS_ENADE_2017.txt"
  etag   = filemd5("../../dados/MICRODADOS_ENADE_2017.txt")
}

resource "aws_s3_object" "spark-operator" {
  for_each = fileset("../../dags/enade/pyspark/", "*")
  bucket   = aws_s3_bucket.buckets[3].id
  key      = "rb/pyspark/${each.value}"
  acl      = "private" # or can be "public-read"
  source   = "../../dags/enade/pyspark/${each.value}"
  etag     = filemd5("../../dags/enade/pyspark/${each.value}")
}

resource "aws_s3_object" "dag-yaml-file" {
  bucket   = aws_s3_bucket.buckets[3].id
  key      = "rb/enade-convert-parquet.yaml"
  acl      = "private" # or can be "public-read"
  source   = "../../dags/enade/enade-convert-parquet.yaml"
  etag     = filemd5("../../dags/enade/enade-convert-parquet.yaml")
}
