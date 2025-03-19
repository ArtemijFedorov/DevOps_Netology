# VM number one 

resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


# data "yandex_compute_image" "ubuntu" {
#   family = "ubuntu-2004-lts"
# }

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}


resource "yandex_compute_instance" "platform" {
  # name        = "netology-develop-platform-web"
  name = var.vm_web_name
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

# VM number two

resource "yandex_vpc_network" "develop2" {
  name = var.vm_db_vpc_name
}
resource "yandex_vpc_subnet" "develop2" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop2.id
  v4_cidr_blocks = var.vm_db_default_cidr
}


# data "yandex_compute_image" "ubuntu" {
#   family = "ubuntu-2004-lts"
# }

data "yandex_compute_image" "ubuntu2" {
  family = var.vm_db_family
}


resource "yandex_compute_instance" "platform2" {
  # name        = "netology-develop-platform-web"
  name = var.vm_db_name
  platform_id = "standard-v3"
  zone        = "ru-central1-b"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop2.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vm_db_ssh_root_key}"
  }

}