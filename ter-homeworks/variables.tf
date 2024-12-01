###cloud vars
variable "cloud_id" {
  type        = string
  default     = "b1gdrqnshqf126ut2k0v"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g4c86dfcui5u4nklci"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "netology-net1"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBc+YL0dF3oI+J4stkmXoVHm6UzAGNKc8rSyfmH84+mK fedor@ARTI"
  description = "ssh-keygen -t ed25519"
}


# Замена переменных
variable "vm_web_family" {
  type = string
  default = "ubuntu-2004-lts"
  description = "default var for vm_web_family"
}

variable "vm_web_name" {
  type = string
  default = "netology-develop-platform-web"
  description = "default var for vm_web_name"
}