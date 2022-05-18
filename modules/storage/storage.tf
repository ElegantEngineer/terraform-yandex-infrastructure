// Use keys to create bucket (privat)
resource "yandex_storage_bucket" "private-project-bucket-name" {
  access_key = var.sa_access_key
  secret_key = var.sa_secret_key
  bucket     = "${var.private-bucket-name}"
}

// Use keys to create bucket (public)
resource "yandex_storage_bucket" "public-project-bucket-name" {
  access_key = var.sa_access_key
  secret_key = var.sa_secret_key
  bucket     = "${var.public-bucket-name}"
  acl        = "public-read"
}
