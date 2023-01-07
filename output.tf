output "jenkins-server-url" {
  value = "http://${google_compute_instance.jk_vm_instance.network_interface.0.access_config.0.nat_ip}:8080"
}
