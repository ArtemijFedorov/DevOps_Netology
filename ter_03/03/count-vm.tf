resource "yandex_compute_instance" "count" {
    count = 2
    name = "web-${count.index+1}"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = "fd8f5cvdq4amabqltvr0"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [ 
      yandex_vpc_security_group.example.id
    ]

  }

    metadata = {
    serial-port-enable = 1
    ssh-keys           = "fedor:${local.ssh-keys}"
  }
}