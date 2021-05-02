
resource "google_compute_firewall" "allow_mirroring" {
  name      = "allow-packet-mirroring-ingress-${base_name}"
  network   = var.network
  direction = "ingress"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_tags        = var.source_network_tags
  destination_ranges = ["${var.ilb_ip_cidr}"]
}

resource "google_compute_firewall" "allow_ssh" {
  name      = "allow-ssh-${base_name}"
  network   = var.network
  direction = "ingress"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["allow-ssh-${base_name}"]
}

resource "google_compute_firewall" "allow_health_check" {
  name      = "allow-health-check-${base_name}"
  network   = var.network
  direction = "ingress"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags = ["allow-ssh-${base_name}"]
}

