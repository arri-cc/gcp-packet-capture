resource "google_compute_instance" "vm" {
  name         = "${var.base_name}-vm"
  machine_type = var.machine_type
  zone         = var.zone
  project      = var.project
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network    = data.google_compute_network.network.id
    subnetwork = google_compute_subnetwork.subnet.id
  }

  tags = ["${var.compute_tag}"]

  metadata_startup_script = <<EOF
    #! /bin/bash
    if [ -f /etc/startup_script_completed ]; then
    exit 0
    fi
    apt-get update
    apt-get install tcpdump nginx -y
    touch /etc/startup_script_completed
    EOF
}

resource "google_compute_instance_group" "ig" {
  name        = "${var.base_name}-ig"
  description = "Unmanaged instance group for packet capture"
  project     = var.project
  network     = data.google_compute_network.network.id
  zone        = var.zone
  instances = [
    google_compute_instance.vm.id
  ]
}
