#allow_jenkins
resource "google_compute_firewall" "allow-jk-port" {
  name    = "fw-allow-jk"
  network = google_compute_network.jk_vpc.name
  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["jk-port"]
}

#allow_ssh
resource "google_compute_firewall" "allow-ssh" {
  name    = "fw-allow-ssh"
  network = google_compute_network.jk_vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
