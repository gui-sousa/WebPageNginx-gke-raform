resource "kubernetes_service_v1" "nginx-lb" {
   metadata {
     name = "nginx-lb"
     namespace = "default"
     labels = {
       run = "nginx-test"
     }
   } 

   spec {
    port {
      protocol = "TCP"
      port = 80
      targetPort = 80
    }

    selector = {
      run = "nginx-test"
    }
    type = "LoadBalancer"
    load_balancer_ip = ""
   }
  
  depends_on = [
    kubernetes_deployment.nginx-deployment
  ]
}