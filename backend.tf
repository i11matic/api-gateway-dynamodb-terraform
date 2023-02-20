
terraform {
  backend "s3" {
    bucket = "github-terraform-state"
    key    = "api-gateway-dynamodb-state"
    region = "us-west-2"
  }
}
