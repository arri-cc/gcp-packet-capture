resource "google_compute_subnetwork" "subnet" {
  name          = "${base_name}-subnet"
  ip_cidr_range = subnet_cidr
  region        = region
  network       = network
}

