# this file is to set up the providers - like AWS provider , Azure provider etc

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.32.1"
    }
  }

}


