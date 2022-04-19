provider "heroku" {
  email   = var.HEROKU_EMAIL
  api_key = var.HEROKU_API_KEY
}

resource "heroku_app" "boilerplate" {
  name       = "golang-boilerplate-2449579"
  region     = "us"
  stack      = "container"
  buildpacks = ["heroku/go"]
}
