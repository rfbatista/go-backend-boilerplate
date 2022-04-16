resource "heroku_app" "boilerplate" {
  name   = "golang_boilerplate"
  region = "us"
}

resource "heroku_build" "this" {
  depends_on = [heroku_addon.postgres]
  app        = heroku_app.this.id
  source = {
    path = "../pkg"
  }

  provisioner "local-exec" {
    command = "bash ./scripts/health-check ${heroku_app.this.web_url}"
  }
}

output "web_url" {
  value = heroku_app.this.web_url
}