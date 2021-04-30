resource "google_compute_instance" "vm" {
  name         = "${base_name}-vm"
  machine_type = "e2-medium"
  zone         = zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network    = network
    subnetwork = google_compute_subnetwork.subnet.self_link
  }

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
