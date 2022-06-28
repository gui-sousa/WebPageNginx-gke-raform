resource "kubernetes_deployment" "nginx-deployment" {
  metadata {
    name = "nginx-deployment"

    labels = {
      run = "nginx-test"
    }
  }


  spec {
    replicas = 3


    strategy {
      type = "RollingUpdate"

      rolling_update {
        max_surge       = 3
        max_unavailable = 0
      }
    }

    selector {
      match_labels = {
        run = "nginx-test"
      }
    }

    template {
      metadata {
        labels = {
          run = "nginx-test"
        }
      }
      spec {
        container {
          name  = "nginx-test"
          image = "southamerica-east1-docker.pkg.dev/develop-348618/nginx-reppo/guisousa/nginx-hello-world:latest"

          port {
            container_port = 80
          }
        }
      }
    }
  }

  depends_on = [
    google_container_node_pool.node-pool-nginx
  ]
}