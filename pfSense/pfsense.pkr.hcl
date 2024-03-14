packer {
  required_plugins {
    vsphere = {
      source  = "github.com/hashicorp/vsphere"
      version = "~> 1"
    }
  }
}
//  pfSense-CE-2.7.2-RELEASE-amd64.iso 
source "vsphere-iso" "pfSense-CE-2-7-2" {
    // VM Specs
    vm_name = "${var.vm_name}"
    CPUs    = "${var.vm_cpus}"
    RAM     = "${var.vm_ram}"
    firmware = "bios"
        network_adapters {
      network      = "${var.vm_network}"
      network_card = "vmxnet3"
    }
    network_adapters {
      network      = "${var.vm_network2}"
      network_card = "vmxnet3"
    }

    storage {
      disk_size = "${var.vm_disk_size}"
      disk_thin_provisioned = true
    }

    // Store Config
    username       = "${var.vcenter_username}"
    password         = "${var.vcenter_password}"
    vcenter_server = "${var.vcenter_server}"
    insecure_connection  = true
    cluster             = "${var.vcenter_cluster}"
    datastore           = "${var.vcenter_datastore}"
    datacenter          = "${var.vcenter_datacenter}"
    convert_to_template  = "true"
    content_library_destination {
      library = "${var.vcenter_content_library}"
      ovf     = true
    }

    // Boot Config
    boot_command = ["e<enter><wait>","<enter><wait>", "<enter><wait>","<enter><wait>", "<enter><wait>", "<spacebar><enter><wait>", "<left><enter>", "<wait30s>", "<enter>"]

    // boot_order   = "disk,cdrom"
    boot_wait    = "25s"
    iso_checksum = "none"
    iso_paths      = ["${var.iso_path}"]

    // SSH Config
    ssh_username = "${var.vm_username}"
    ssh_password = "${var.vm_password}"
}

build {
  sources = ["source.vsphere-iso.pfSense-CE-2-7-2"]
}