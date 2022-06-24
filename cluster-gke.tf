resource "google_container_cluster" "cluster-nginx" {
  name     = "cluster-nginx"
  location = var.zona
  project  = var.projeto

  initial_node_count = 3
  #remove_default_node_pool = true

}

resource "google_container_node_pool" "node-pool-nginx" {
  name     = "node-pool-nginx"
  location = var.zona
  project  = var.projeto
  cluster  = google_container_cluster.cluster-nginx.name


  node_config {
    preemptible  = true
    machine_type = var.tipo-vm
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

  }

  depends_on = [
    google_container_cluster.cluster-nginx
  ]
}
