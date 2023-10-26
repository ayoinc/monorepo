terraform {
  backend "s3" {
    bucket  = "superdockyarder"
    key     = "staging.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}