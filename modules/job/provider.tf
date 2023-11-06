terraform {
  required_version = "~> 1"
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.27.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}