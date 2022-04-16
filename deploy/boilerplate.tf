resource "heroku_app" "boilerplate" {
  name   = "golang_boilerplate"
  region = "us"
}

resource "heroku_build" "boilerplate" {
  app        = heroku_app.boilerplate.id
  buildpacks = ["https://github.com/heroku/heroku-buildpack-go"]
  source {
    path = "../pkg"
  }

  provisioner "local-exec" {
    command = "bash ../scripts/health-check ${heroku_app.boilerplate.web_url}"
  }
}

resource "heroku_formation" "boilerplate" {
  app      = heroku_app.boilerplate.id
  type     = "web"
  quantity = 1
  size     = "Standard-1x"
}

output "web_url" {
  value = heroku_app.boilerplate.web_url
}