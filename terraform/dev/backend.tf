terraform {
  cloud {
    organization = "kgen"
    workspaces {
      name = "portfolio"
    }
  }
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 4.6.0"
    }
  }
  required_version = ">= 0.13.0"
}
