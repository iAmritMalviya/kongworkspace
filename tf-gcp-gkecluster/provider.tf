provider "google" {
  project     = "apigatewaysandbox"
  region      = "us-central1"
  zone        = "us-central1-b"
  # credentials = var.google_credentials
  credentials = file("apigatewaysandbox-7f14028ba93b.json")
}
