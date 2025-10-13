// packer/builds/ubuntu-dev-qemu.pkr.hcl

packer {
  required_plugins {
    qemu = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/qemu"
    }
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "qemu" "ubuntu-dev" {
  iso_url            = "https://releases.ubuntu.com/22.04/ubuntu-22.04.3-live-server-amd64.iso"
  iso_checksum       = "sha256:f8922052750d816a53440337253e7434318d2839d0e51656c7c8a4b3d4a5fe0c"
  output_directory   = "builds/ubuntu-dev-qemu"
  format             = "qcow2"
  accelerator        = "kvm"
  headless           = true

  ssh_username       = var.ssh_username
  ssh_password       = var.ssh_password
  ssh_timeout        = "20m"
  shutdown_command   = "echo 'devpass' | sudo -S shutdown -P now"

  boot_wait          = "10s"
  boot_command       = [
    "<enter><wait>",
    "linux /casper/vmlinuz quiet autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<enter>",
    "initrd /casper/initrd<enter>",
    "boot<enter>"
  ]

  http_directory     = "../http"
  cpus               = var.vm_cpus
  memory             = var.vm_memory
  disk_size          = var.vm_disk_size
}

build {
  sources = ["source.qemu.ubuntu-dev"]

  provisioner "ansible" {
    playbook_file = "../../ansible/playbook-dev-env.yml"
    user          = var.ssh_username
    extra_arguments = [
      "--extra-vars",
      "ansible_password=${var.ssh_password}"
    ]
  }
}
