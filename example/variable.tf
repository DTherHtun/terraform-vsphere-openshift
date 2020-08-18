variable "vms" {
  type = list(
    object({
      vm_type           = string
      num_of_vm         = number
      cpu_number        = number
      ram_size          = number
      vm_folder         = string
      vm_template       = string
      vm_rp             = string
      data_disk_label   = list(string)
      data_disk_size_gb = list(string)
      data_unit_number  = list(number)
      network_cards     = string
      ipv4_submask      = string
      ipv4_suffix       = number
      ipv4_prefix       = string
      ipv4_gateway      = string
    })
  )
}

variable "dc" {
  type = string
}

variable "cluster" {
  type = string
}

variable "datastore" {
  type = string
}

variable "prefix" {
  type    = string
  default = "mm2p"
}

variable "vm_domain" {
  type    = string
  default = "opslab.tech"
}

variable "vm_dns" {
  type    = list(string)
  default = ["1.1.1.1", "8.8.8.8"]
}
