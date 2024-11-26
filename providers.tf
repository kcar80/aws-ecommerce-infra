provider "aws" {
  region = "us-east-1"
}

# Random Suffix for Unique Resources
resource "random_string" "suffix" {
  length  = 8
  special = false
}
