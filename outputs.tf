resource "google_compute_address" "nginx-lb-ip" {
  name   = "nginx-lb-ip"
  region = var.regiao
}


output "url-app" {
  value = "http://${google_compute_address.nginx-lb-ip.address}"
}