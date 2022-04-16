variable "HEROKU_API_KEY" {
  type        = string
  description = "API key for Heroku authentication"
}

variable "HEROKU_EMAIL" {
  type        = string
  description = "API key for Heroku authentication"
}

provider "heroku" {
  email   = var.HEROKU_EMAIL
  api_key = var.HEROKU_API_KEY
}