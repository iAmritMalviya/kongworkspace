resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
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
  namespace = "ingress-nginx"
  create_namespace = "true"
  set {
    name  = "namespace"
    value = "ingress-nginx"
  }
}
