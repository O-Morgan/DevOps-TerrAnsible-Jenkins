terraform {
required_version = "~> 1.9.5"
  backend "s3" {
    bucket         = "terransible-tf-state-300"  # Replace with your actual S3 bucket name
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "TerrAnsibleLocks"
  }
}