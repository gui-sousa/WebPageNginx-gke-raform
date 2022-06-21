resource "google_artifact_registry_repository" "nginx-repo" {
  provider = google-beta

  project       = var.projeto
  repository_id = "nginx-reppo"
  location      = var.regiao
  format        = "DOCKER"
}

resource "null_resource" "nginx-docker-image" {
  provisioner "local-exec" {
    command = "./push-docker-nginx.sh"
  }

  depends_on = [
    google_artifact_registry_repository.nginx-repo
  ]
}