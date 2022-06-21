provider "google" {
  credentials = file("gcp-dev.json")
  project     = var.projeto
  region      = var.regiao
}

provider "google-beta" {
  credentials = file("gcp-dev.json")
  project     = var.projeto
  region      = var.regiao

}
