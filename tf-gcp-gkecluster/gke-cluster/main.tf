
# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.cluster_name}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.cluster_name}-subnet"
  region        = "${var.region}"
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name                     = "${var.cluster_name}"
  location                 = "${var.location}"
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name
  location   = "${var.location}" 
  cluster    = google_container_cluster.primary.name
  node_count = "${var.gke_num_nodes}"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = "${var.cluster_name}"
    }

    # preemptible  = true
    disk_size_gb = 30 
    machine_type = "n1-standard-2"
    tags         = ["gke-node", "${var.cluster_name}"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
