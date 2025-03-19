###cloud vars
variable "vm_db_cloud_id" {
  type        = string
  default     = "b1gdrqnshqf126ut2k0v"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "vm_db_folder_id" {
  type        = string
  default     = "b1g4c86dfcui5u4nklci"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "netology-net2"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vm_db_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBc+YL0dF3oI+J4stkmXoVHm6UzAGNKc8rSyfmH84+mK fedor@ARTI"
  description = "ssh-keygen -t ed25519"
}


# Замена переменных
variable "vm_db_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "default var for vm_db_family"
}

variable "vm_db_name" {
  type = string
  default = "netology-develop-platform-db"
  description = "default var for vm_db_name"
}