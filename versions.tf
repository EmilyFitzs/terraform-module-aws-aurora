terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      version = ">= 3.48.0"
    }
    random = {
      version = "~> 3.0"
    }
  }
}
