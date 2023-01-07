# create VPC
resource "google_compute_network" "jk_vpc" {
  name                    = "jk-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

# create public subnet
resource "google_compute_subnetwork" "jk_network_subnet" {
  name          = "jk-subnet"
  ip_cidr_range = var.network-subnet-cidr
  network       = google_compute_network.jk_vpc.name
  region        = var.gcp_region
}
