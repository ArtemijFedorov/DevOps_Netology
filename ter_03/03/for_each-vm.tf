variable "wm_resources" {
  type        = list(object({ vm_name=string, cpu=number, ram=number, disk=number, core_fraction=number}))
  default     = [
    {vm_name="main", 
     cpu=2, 
     ram=2, 
     disk=1
     core_fraction=5
},
    {vm_name="replica", 
     cpu=2, 
     ram=2, 
     disk=1
     core_fraction=5
  }
]
}

locals {
  ssh-keys = file("/home/fedor/.ssh/id_ed25519.pub")
}

resource "yandex_compute_instance" "for_each" {


  depends_on = [yandex_compute_instance.count]

  for_each = {for env in var.wm_resources : env.vm_name => env}
  platform_id = "standard-v1"
  name = each.value.vm_name
  
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
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
    ssh-keys           = "ubuntu:${local.ssh-keys}"
  }
}

output "SSH"{
value = local.ssh-keys
}
