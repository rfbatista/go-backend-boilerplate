provider "heroku" {
  email   = var.HEROKU_EMAIL
  api_key = var.HEROKU_API_KEY
}

resource "heroku_app" "boilerplate" {
  id         = var.APPLICATION_ID
  name       = var.APPLICATION_ID
  region     = "us"
  stack      = "container"
  buildpacks = ["heroku/go"]
}
