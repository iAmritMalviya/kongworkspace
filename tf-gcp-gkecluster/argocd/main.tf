resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.34.6"
  namespace = "argocd"
  create_namespace = "true"
  set {
    name  = "namespace"
    value = "argocd"
  }
  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = "$2a$12$Fgo2TbYl3SJPu5EKnqiV0.fVCbjelS5la1IJecO8/1OfiSkkmzbY."
  }
}


resource "helm_release" "cert-manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "1.12.1"
  namespace = "cert-manager"
  create_namespace = "true"
  set {
    name  = "namespace"
    value = "cert-manager"
  }
  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "ingress-nginx" {
  name       = "ingress-nginx"
  repository = "https://helm.nginx.com/stable"
  chart      = "nginx-ingress"
  version    = "0.17.1"
  namespace = "ingress-nginx"
  create_namespace = "true"
  set {
    name  = "namespace"
    value = "ingress-nginx"
  }
}

