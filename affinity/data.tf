data "vsphere_datacenter" "dc" {
  name = var.dc
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "host" {
  count         = var.num_of_esxi_host
  name          = format("%s-esx%s.%s", var.prefix, format("%02d", count.index + 1), var.suffix_domain)
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "ocp_master" {
  count         = var.num_of_master
  name          = format("%s-master%s.%s", var.prefix, format("%02d", count.index + 1), var.suffix_domain)
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "ocp_infra" {
  count         = var.num_of_infra
  name          = format("%s-infra%s.%s", var.prefix, format("%02d", count.index + 1), var.suffix_domain)
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "ocp_worker" {
  count         = var.num_of_worker
  name          = format("%s-infra%s.%s", var.prefix, format("%02d", count.index + 1), var.suffix_domain)
  datacenter_id = data.vsphere_datacenter.dc.id
}
