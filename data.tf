data "vsphere_datacenter" "dc" {
  name = var.dc
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  count         = length(local.hosts[*].vm_rp)
  name          = local.hosts[count.index].vm_rp
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  count         = length(local.hosts[*].net_cards)
  name          = local.hosts[count.index].net_cards
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  count         = length(local.hosts[*].vm_template)
  name          = local.hosts[count.index].vm_template
  datacenter_id = data.vsphere_datacenter.dc.id
}
