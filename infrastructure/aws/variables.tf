variable "region_id" {
  default = "us-east-2"
}

variable "prefix" {
  default = "edc-mod4"
}

variable "account" {
  default = 774178677404
}

# Prefix configuration and project common tags
locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Project      = "Desafio-Mod4-IGTI"
    ManagedBy    = "Terraform"
    Owner        = "Ramon Bonela"
    BusinessUnit = "Data Engineering"
    Environment  = terraform.workspace
    UserEmail    = "ramonbonela@gmail.com"
  }
}

variable "bucket_names" {
  description = "Create S3 buckets with these names"
  type        = list(string)
  default = [
    "landing-zone",
    "staging-zone",
    "delivery-zone",
    "emr-code"
  ]
}

variable "database_names" {
  description = "Create databases with these names"
  type        = list(string)
  default = [
    #landing-zone
    "dl_landing_zone",
    "dl_staging_zone",
    "dl_delivery_zone"
  ]
}

variable "bucket_paths" {
  description = "Paths to S3 bucket used by the crawler"
  type        = list(string)
  default = [
    "s3://edc-mod4-staging-zone-774178677404/enade/",
  ]
}