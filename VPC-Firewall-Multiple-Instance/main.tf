provider "google" {
  credentials = file("~/line-data/.secrets/key.json")
  project     = var.project
  region      = var.region
}

resource "google_compute_network" "my_network" {
  name                    = var.vpc_network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "my_subnet" {
  name          = var.vpc_subnet1
  ip_cidr_range = "10.0.0.0/28"
  network       = google_compute_network.my_network.self_link
  depends_on    = [google_compute_network.my_network]
}

resource "google_compute_instance" "my-instance" {
  name         = var.vm_instance_name
  machine_type = var.vm_machine_type
  zone         = var.vm_zone
  deletion_protection = false
  
  network_interface {
    network    = google_compute_network.my_network.self_link
    subnetwork = google_compute_subnetwork.my_subnet.self_link
  }

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-12-bookworm-v20240415"
    }
  }
   metadata_startup_script =  "sudo apt-get update; sudo apt-get install -y nginx; sudo systemctl start nginx"      // renderning script from template file

  depends_on = [google_compute_network.my_network, google_compute_subnetwork.my_subnet]
}
