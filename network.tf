data "google_compute_network" "network" {
  name    = var.network
  project = var.project
}
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.base_name}-subnet"
  project       = var.project
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = data.google_compute_network.network.id
}

resource "google_compute_forwarding_rule" "ilb" {
  provider               = google-beta
  name                   = "${var.base_name}-ilb"
  project                = var.project
  region                 = var.region
  is_mirroring_collector = true
  load_balancing_scheme  = "INTERNAL"
  network                = data.google_compute_network.network.id
  subnetwork             = google_compute_subnetwork.subnet.id
  all_ports              = true
  backend_service        = google_compute_region_backend_service.backend.id
}

resource "google_compute_region_backend_service" "backend" {
  provider              = google-beta
  name                  = "${var.base_name}-backend"
  project               = var.project
  region                = var.region
  load_balancing_scheme = "INTERNAL"
  protocol              = "TCP"
  health_checks         = [google_compute_region_health_check.hc.id]
  backend {
    group = google_compute_instance_group.ig.self_link
  }
}
resource "google_compute_region_health_check" "hc" {
  provider           = google-beta
  name               = "${var.base_name}-health-check"
  project            = var.project
  check_interval_sec = 1
  timeout_sec        = 1
  region             = var.region

  http_health_check {
    port = "80"
  }
}
