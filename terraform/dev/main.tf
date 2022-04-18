provider "heroku" {
  email   = var.HEROKU_EMAIL
  api_key = var.HEROKU_API_KEY
}

resource "heroku_app" "boilerplate" {
  name   = "golang_boilerplate"
  region = "us"
	stack = "container"
	buildpacks = ["heroku/go"]
}
