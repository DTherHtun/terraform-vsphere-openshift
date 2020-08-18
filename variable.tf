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
	description = "vms - this variable contain vm spec and different vm type that you want to create"
	default = [
  {
    vm_type           = "master"
    num_of_vm         = 3
    cpu_number        = 4
    ram_size          = 8
    vm_folder         = "openshift"
    vm_rp             = "rp-ocp-master"
    vm_template       = "template-redhatu-q2-ocp-master"
    data_disk_label   = ["disk_0", "disk_1"]
    data_disk_size_gb = ["85", "50"]
    data_unit_number  = [0, 1]
    network_cards     = "pg-vlan103-ocp"
    ipv4_submask      = "22"
    ipv4_prefix       = "10.15.20.%s"
    ipv4_suffix       = 10
    ipv4_gateway      = "10.15.23.245"
  },
  {
    vm_type           = "infra"
    num_of_vm         = 4
    cpu_number        = 4
    ram_size          = 8
    vm_folder         = "openshift"
    vm_rp             = "rp-ocp-infra"
    vm_template       = "template-redhat7-q2-ocp-infra"
    data_disk_label   = ["disk_0", "disk_1"]
    data_disk_size_gb = ["85", "50"]
    data_unit_number  = [0, 1]
    network_cards     = "pg-vlan102-ocp"
    ipv4_submask      = "22"
    ipv4_prefix       = "10.15.20.%s"
    ipv4_suffix       = 20
    ipv4_gateway      = "10.15.23.245"
  },
  {
    vm_type           = "worker"
    num_of_vm         = 10
    cpu_number        = 12
    ram_size          = 64
    vm_folder         = "openshift"
    vm_rp             = "rp-ocp-worker"
    vm_template       = "template-redhat7-q2-ocp-worker"
    data_disk_label   = ["disk_0", "disk_1"]
    data_disk_size_gb = ["165", "250"]
    data_unit_number  = [0, 1]
    network_cards     = "pg-vlan101-ocp"
    ipv4_submask      = "22"
    ipv4_prefix       = "10.15.20.%s"
    ipv4_suffix       = 100
    ipv4_gateway      = "10.15.23.245"
  }
]
}

variable "dc" {
  type        = string
  description = "Name of the datacenter"
}

variable "cluster" {
  type        = string
  description = "Name of Cluster"
}

variable "datastore" {
  type = string
	description = "Name of Datastore"
}

variable "prefix" {
  type    = string
  default = "mm2p"
	description = "Just prefix for hostname"
}

variable "vm_domain" {
  type    = string
  default = "opslab.tech"
	description = "domain use in internal"
}

variable "vm_dns" {
  type    = list(string)
  default = ["1.1.1.1", "8.8.8.8"]
	description = "dns server list"
}
