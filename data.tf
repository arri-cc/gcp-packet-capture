data "google_container_cluster" "gke" {
  name     = var.source_gke_cluster_name
  project  = var.project
  location = var.region
}

data "google_compute_network" "network" {
  name    = var.network
  project = var.project
}
