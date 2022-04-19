provider "heroku" {
  email   = var.HEROKU_EMAIL
  api_key = var.HEROKU_API_KEY
}

resource "heroku_app" "boilerplate" {
  name       = var.APPLICATION_ID
  region     = "us"
  stack      = "container"
  buildpacks = ["heroku/go"]
}
