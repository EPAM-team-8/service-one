terraform {

  backend "s3" {
    region         = "us-east-2"
    bucket         = "epam-terraform-remote-state"
    dynamodb_table = "terraform-lock"
    key            = "service1/state.tfstate"
    encrypt        = true
  }
}


provider "aws" {
  profile = "default"
  region  = "us-east-2"
}
