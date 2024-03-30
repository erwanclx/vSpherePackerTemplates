# Packer Windows Server 2022

variable "vm_name" {
  type = string
  default = "windows-server-2022-vm"
}

variable "vm_cpus" {
  type = number
  default = 4
}

variable "vm_ram" {
  type = number
  default = 4096
}

variable "vm_network" {
  type = string
  default = "LAN"
}

variable "vm_disk_size" {
  type = number
  default = 90000
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
  default = "Site AG"
}

variable "vcenter_datastore" {
  type = string
  default = "Datastore 2 SSD"
}

variable "vcenter_datacenter" {
  type = string
  default = "Site AG"
}

variable "vcenter_content_library" {
  type = string
  default = "Packer Library"
}

// Boot Config

variable "iso_path" {
  type = string
  default = "[Datastore 2 SSD] SERVER_EVAL_x64FRE_en-us.iso"
}

// WinRM Config

variable "vm_username" {
  type = string
  default = "Administrator"
  description = "/!\ USERNAME MUST MATCH THE AUTOUNATTEND.XML CONTENT FILE /!\\"
}

variable "vm_password" {
  type = string
  default = "PackerInsecurePassword"
  sensitive = true
  description = "/!\ PASSWORD MUST MATCH THE AUTOUNATTEND.XML CONTENT FILE /!\\"
}