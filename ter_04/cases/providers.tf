terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}

provider "yandex" {
  cloud_id                 = "b1gdrqnshqf126ut2k0v"
  folder_id                = "b1g4c86dfcui5u4nklci"
  token                    = var.token
  # service_account_key_file = file("/home/fedor/.ssh/id_ed25519.pub")
  zone                     = "ru-central1-a" #(Optional) 
}
