resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = <<EOT
      kubectl create namespace kong
      sleep 30
      kubectl create secret generic kong-config-secret -n kong \
      --from-literal=portal_session_conf='{"storage":"kong","secret":"super_secret_salt_string","cookie_name":"portal_session","cookie_same_site":"Lax","cookie_secure":false}' \
      --from-literal=admin_gui_session_conf='{"storage":"kong","secret":"super_secret_salt_string","cookie_name":"admin_session","cookie_same_site":"Lax","cookie_secure":false}' \
      --from-literal=pg_host="enterprise-postgresql.kong.svc.cluster.local" \
      --from-literal=kong_admin_password=kong \
      --from-literal=password=kong
      kubectl create namespace monitoring
      sleep 30
      kubectl apply -f ${path.module}/obeservability.yaml
      sleep 30
      kubectl apply -f ${path.module}/cert-clusterissuer.yaml
      sleep 30
      kubectl creat -f ${path.module}/kong-self-sigined.yaml -n kong
      sleep 30
      kubectl apply -f ${path.module}/kong-gateway.yaml
      ingress_lb=`kubectl get svc ingress-nginx-nginx-ingress-controller -n ingress-nginx --no-headers=true | awk '{print $4}'`
      echo $ingress_lb

    EOT
  }
}
