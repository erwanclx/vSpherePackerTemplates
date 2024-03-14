# Packer pfSense 2.7.2

variable "vm_name" {
  type = string
  default = "pfsense"
}

variable "vm_cpus" {
  type = number
  default = 2
}

variable "vm_ram" {
  type = number
  default = 2048
}

variable "vm_network" {
  type = string
  default = "LAN"
}

variable "vm_network2" {
  type = string
  default = "LAN"
}

variable "vm_disk_size" {
  type = number
  default = 10240
}

// Store Config

variable "vcenter_server" {
  type = string
}

variable "vcenter_username" {
  type = string
}

variable "vcenter_password" {
  type = string
  sensitive = true
}

variable "vcenter_cluster" {
  type = string
  default = "Site A"
}

variable "vcenter_datastore" {
  type = string
  default = "Datasore 1 SSD"
}

variable "vcenter_datacenter" {
  type = string
  default = "Site Arthur"
}

variable "vcenter_content_library" {
  type = string
  default = "Packer Library"
}

// Boot Config

variable "iso_path" {
  type = string
  default = "[Datasore 1 SSD] pfSense-CE-2.7.2-RELEASE-amd64.iso"
}

// SSH Config
variable "vm_username" {
  type = string
  default = "ubuntu"
  description = "USERNAME MUST MATCH THE USER-DATA CONTENT FILE"
}

variable "vm_password" {
  type = string
  default = "ubuntu"
  sensitive = true
  description = "PASSWORD MUST MATCH THE USER-DATA CONTENT FILE"
}