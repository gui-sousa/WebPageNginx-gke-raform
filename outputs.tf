resource "google_compute_address" "nginx-lb-ip" {
  name   = "nginx-lb-ip"
  region = var.regiao
}


output "url-app" {
  value = "http://${kubernetes_service_v1.nginx-lb.status.0.load_balancer.0.ingress.0.ip}:80"
}