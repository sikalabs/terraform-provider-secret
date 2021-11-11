terraform {
  required_providers {
    secret = {
      source  = "local/local/secret"
      version = "0.1.0-dev"
    }
  }
}

provider "secret" {}

resource "secret_secret" "foo" {}
resource "secret_secret" "bar" {}

output "foo" {
  value = nonsensitive(secret_secret.foo.value)
}

output "bar" {
  value     = secret_secret.bar.value
  sensitive = true
}
