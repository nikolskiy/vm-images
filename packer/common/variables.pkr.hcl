// packer/common/variables.pkr.hcl

variable "vm_cpus" {
  type    = number
  default = 2
}

variable "vm_memory" {
  type    = number
  default = 2048
}

variable "vm_disk_size" {
  type    = number
  default = 20480
}

variable "ssh_username" {
  type    = string
  default = "devuser"
}

variable "ssh_password" {
  type      = string
  default   = "devpass"
  sensitive = true
}
