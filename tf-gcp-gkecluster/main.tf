module "gke-cluster" {
    source = "./gke-cluster/"
    cluster_name = var.cluster_name
    region = var.region
    location = var.location
    project_id = var.project_id
    gke_num_nodes = var.gke_num_nodes 
}

module "argocd" {
    source = "./argocd/"
}

module "kubectl" {
    source = "./kubectl/"
}

