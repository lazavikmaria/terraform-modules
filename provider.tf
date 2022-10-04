provider "aws" {
  access_key                  = var.aws_access_key
  secret_key                  = var.aws_secret_key
  region                      = var.aws_region
  skip_credentials_validation = true


  default_tags {
    tags = {
      Environment = "dev"
      Project     = "vertex"
    }
  }
} 