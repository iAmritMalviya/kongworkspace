resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = <<EOT
      kubectl create namespace kong
      kubectl create namespace monitoring
      sleep 10
      kubectl apply -f ${path.module}/kong-secrets.yaml
      kubectl apply -f ${path.module}/kong-self-sigined.yaml -n kong
      sleep 10
      kubectl apply -f ${path.module}/kong-gateway.yaml
      sleep 60
      kubectl apply -f ${path.module}/kic.yaml
      sleep 5
      kubectl apply -f ${path.module}/obeservability.yaml
      sleep 5
      kubectl apply -f ${path.module}/prometheus.yaml
    EOT
  }
}
