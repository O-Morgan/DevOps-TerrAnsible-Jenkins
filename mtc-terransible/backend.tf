terraform {
  backend "s3" {
    bucket         = "terransible-tf-state-300"  # Replace with your actual S3 bucket name
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "TerrAnsibleLocks"
  }
}