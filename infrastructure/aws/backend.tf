# Backend configuration require a AWS storage bucket.
terraform {
  backend "s3" {
    bucket = "edc-m4-desafio-terraform-bckend"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}
