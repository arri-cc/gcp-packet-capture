resource "google_compute_packet_mirroring" "mirroring" {
  name        = "${var.base_name}-mirroring-policy"
  description = "packet mirroring policy"
  project     = var.project
  region      = var.region
  network {
    url = data.google_compute_network.network.id
  }
  collector_ilb {
    url = google_compute_forwarding_rule.ilb.id
  }
  mirrored_resources {
    tags = var.source_network_tags
  }
  filter {
    ip_protocols = ["tcp"]
    direction    = "BOTH"
  }
}
