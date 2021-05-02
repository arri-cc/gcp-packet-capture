resource "google_compute_firewall" "allow_mirroring" {
  name      = "${var.base_name}-allow-packet-mirroring-ingress"
  network   = var.network
  direction = "INGRESS"
  project   = var.project

  allow {
    protocol = "ICMP"
  }

  allow {
    protocol = "TCP"
  }

  allow {
    protocol = "UDP"
  }

  source_tags = var.source_network_tags
}

//TODO: IAP SSH only
resource "google_compute_firewall" "allow_ssh" {
  name      = "${var.base_name}-allow-ssh"
  network   = var.network
  direction = "INGRESS"
  project   = var.project
  allow {
    protocol = "TCP"
    ports    = ["22"]
  }
  target_tags = ["${var.compute_tag}"]
}

resource "google_compute_firewall" "allow_health_check" {
  name      = "${var.base_name}-allow-health-check"
  network   = var.network
  direction = "INGRESS"
  project   = var.project
  allow {
    protocol = "TCP"
    ports    = ["80"]
  }

  source_ranges = var.health_check_cidrs
  target_tags   = ["${var.compute_tag}"]
}

