resource "google_compute_subnetwork" "subnet" {
  name          = "${var.base_name}-subnet"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = var.network
}
