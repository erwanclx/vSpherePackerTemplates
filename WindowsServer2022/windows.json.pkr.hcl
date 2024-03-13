packer {
  required_plugins {
    vsphere = {
      source  = "github.com/hashicorp/vsphere"
      version = "~> 1"
    }
  }
}

source "vsphere-iso" "ws2022" {
  // VM Specs
  vm_name        = "${var.vm_name}"
  CPUs                 = "${var.vm_cpus}"
  RAM                  = "${var.vm_ram}"
  disk_controller_type = ["pvscsi"]
  firmware             = "efi"
  floppy_files         = ["./scripts/autounattend.xml", "./scripts/enable-winrm.ps1", "./scripts/vmtools.ps1"]
  guest_os_type        = "windows9Server64Guest"
  network_adapters {
    network = "${var.vm_network}"
  }
  storage {
    disk_size             = "${var.vm_disk_size}"
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
  boot_command         = ["<enter>"]
  boot_order           = "disk,cdrom"
  boot_wait            = "1s"
  iso_checksum         = "none"
  iso_paths            = ["${var.iso_path}"]

  // WinRM Config
  communicator         = "winrm"
  // shutdown_command = "C:\\Windows\\system32\\Sysprep\\sysprep.exe /generalize /oobe /shutdown /unattend:a:\\autounattend.xml"
  // shutdown_timeout = "30m"
  shutdown_command = "shutdown /s /t 9 /f"
  winrm_username       = "${var.vm_username}"
  winrm_password       = "${var.vm_password}"

  
}

build {
  sources = ["source.vsphere-iso.ws2022"]

  // provisioner "powershell" {
  //   scripts = ["./scripts/enable-winrm.ps1", "./scripts/vmtools.ps1"]
  // }

  // provisioner "windows-restart" {
  //   restart_timeout = "10m"
  // }

}