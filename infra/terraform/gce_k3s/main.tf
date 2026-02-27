provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

resource "google_compute_instance" "cloud-devsecops" {
  name         = var.instance_name
  machine_type = "e2-micro"
  zone         = var.zone

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default" 
    access_config {
    
    }
  }
}

resource "google_compute_firewall" "allow-http"{
  name = "allow-http-traffic"
  network = "default"

  allow{
    protocol = "tcp"
    ports = ["80"]
  }

  target_tags = ["http-server"]

  source_ranges = ["0.0.0.0/0"]
  }

output "public_ip" {
  value       = google_compute_instance.cloud-devsecops.network_interface[0].access_config[0].nat_ip
  description = "External IP"
}
