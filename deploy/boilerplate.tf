resource "heroku_app" "boilerplate" {
  name   = "golang_boilerplate"
  region = "us"
}

resource "heroku_build" "this" {
  app        = heroku_app.boilerplate.id
  source = {
    path = "../pkg"
  }

  provisioner "local-exec" {
    command = "bash ../scripts/health-check ${heroku_app.boilerplate.web_url}"
  }
}

output "web_url" {
  value = heroku_app.this.web_url
}