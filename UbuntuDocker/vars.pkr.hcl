# Packer Ubuntu 20.04 Docker

variable "vm_name" {
  type    = string
  default = "ubuntu-20.04-docker"
}

variable "vm_cpus" {
  type    = number
  default = 2
}

variable "vm_ram" {
  type    = number
  default = 2048
}

variable "vm_network" {
  type    = string
  default = "LAN"
}

variable "vm_disk_size" {
  type    = number
  default = 20480
}

// Store Config

variable "vcenter_server" {
  type = string
}

variable "vcenter_username" {
  type = string
}

variable "vcenter_password" {
  type      = string
  sensitive = true
}

variable "vcenter_cluster" {
  type    = string
  default = "Site AG"
}

variable "vcenter_datastore" {
  type    = string
  default = "Datastore 2 SSD"
}

variable "vcenter_datacenter" {
  type    = string
  default = "Site AG"
}

variable "vcenter_content_library" {
  type    = string
  default = "Packer Library"
}

// Boot Config

variable "iso_path" {
  type    = string
  default = "https://releases.ubuntu.com/20.04/ubuntu-20.04.6-live-server-amd64.iso"
}

// SSH Config

variable "vm_username" {
  type        = string
  default     = "ubuntu"
  description = "USERNAME MUST MATCH THE USER-DATA CONTENT FILE"
}

variable "vm_password" {
  type        = string
  default     = "ubuntu"
  description = "PASSWORD MUST MATCH THE USER-DATA CONTENT FILE"
}