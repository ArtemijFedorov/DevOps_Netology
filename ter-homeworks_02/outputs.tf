output "platform" {
  value = { 
    name = yandex_compute_instance.platform.name
    external_ip = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    fqdn = yandex_compute_instance.platform.fqdn
  }
}

output "platform2" {
  value = { 
    name = yandex_compute_instance.platform2.name
    external_ip = yandex_compute_instance.platform2.network_interface.0.nat_ip_address
    fqdn = yandex_compute_instance.platform2.fqdn
  }
}