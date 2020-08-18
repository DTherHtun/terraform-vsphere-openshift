provider "vsphere" {
  user           = var.vsphere.usr
  password       = var.vsphere.pass
  vsphere_server = var.vsphere.svr

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

module "openshift-infra" {
  source = "../"

  dc        = var.dc
  cluster   = var.cluster
  datastore = var.datastore
  prefix    = var.prefix
  vm_domain = var.vm_domain
  vm_dns    = var.vm_dns
  vms       = var.vms
}
