resource "google_compute_firewall" "my-network-allow" {
  name       = "my-network-allow-https-http"
  network    = google_compute_network.my_network.self_link
  direction  = "INGRESS"
  depends_on = [google_compute_network.my_network, google_compute_subnetwork.my_subnet]

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "443","22"]
  }

  source_tags = ["http-https-server"]
  source_ranges = ["0.0.0.0/0"]
}
