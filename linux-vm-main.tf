resource "google_compute_instance" "jk_vm_instance" {
  name         = "jk-vm"
  machine_type = var.linux_instance_type
  zone         = var.gcp_zone
  tags         = ["ssh", "jk-port"]

  boot_disk {
    initialize_params {
      image = var.centos_8_sku
    }
  }

  metadata_startup_script = data.template_file.jk-metadata.rendered

  network_interface {
    network    = google_compute_network.jk_vpc.name
    subnetwork = google_compute_subnetwork.jk_network_subnet.name
    access_config {}
  }
}


