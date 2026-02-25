provider "google" {
  project     = "cloud-devsecops-488512" # 실제 ID로 수정
  region      = "asia-northeast3"
  credentials = file("../../../secrets/secret.json") 
}

resource "google_compute_instance" "cloud-devsecops" {
  name         = "cloud-devsecops"
  machine_type = "e2-micro"
  zone         = "asia-northeast3-a"

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