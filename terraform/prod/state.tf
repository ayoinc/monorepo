terraform {
  backend "s3" {
    bucket = "superdockyarder"
    key    = "prod.tfstate"
    region = "eu-west-2"
  }
}
