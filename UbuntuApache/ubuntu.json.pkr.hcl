packer {
  required_plugins {
    vsphere = {
      source  = "github.com/hashicorp/vsphere"
      version = "~> 1"
    }
  }
}

source "vsphere-iso" "ubuntu-20-04-webserver" {
  // VM Specs
  vm_name       = "${var.vm_name}"
  CPUs          = "${var.vm_cpus}"
  RAM           = "${var.vm_ram}"
  firmware      = "efi"
  cd_files      = ["./http/user-data", "./http/meta-data"]
  cd_label      = "cidata"
  guest_os_type = "ubuntu64Guest"
  network_adapters {
    network = "${var.vm_network}"
  }
  storage {
    disk_size             = "${var.vm_disk_size}"
    disk_thin_provisioned = true
  }

  // Store Config
  username            = "${var.vcenter_username}"
  password            = "${var.vcenter_password}"
  vcenter_server      = "${var.vcenter_server}"
  insecure_connection = true
  cluster             = "${var.vcenter_cluster}"
  datastore           = "${var.vcenter_datastore}"
  datacenter          = "${var.vcenter_datacenter}"
  convert_to_template = "true"
  content_library_destination {
    library = "${var.vcenter_content_library}"
    ovf     = true
  }

  // Boot Config
  boot_command = ["e<down><down><down><end>", " autoinstall ds=nocloud;", "<F10>"]
  boot_order   = "disk,cdrom"
  boot_wait    = "3s"
  iso_checksum = "none"
  iso_url      = "${var.iso_path}"


  // SSH Config

  shutdown_command = "echo ${var.vm_password}|sudo -S shutdown -P now"

  ssh_username     = "${var.vm_username}"
  ssh_password     = "${var.vm_password}"
  ssh_port         = 22
  ssh_wait_timeout = "10m"
}

build {
  sources = ["source.vsphere-iso.ubuntu-20-04-webserver"]

  provisioner "shell" {
    execute_command = "echo ${var.vm_username} | {{ .Vars }} sudo -E -S bash '{{ .Path }}'"
    scripts         = ["scripts/install_webserver.sh"]
  }

}
