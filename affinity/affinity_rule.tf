resource "vsphere_compute_cluster_vm_affinity_rule" "cluster_rule_master" {
  name                = var.affinity_rule_master
  compute_cluster_id  = data.vsphere_compute_cluster.cluster.id
  virtual_machine_ids = [data.vsphere_virtual_machine.ocp_master.*.id]
}

resource "vsphere_compute_cluster_vm_affinity_rule" "cluster_rule_infra" {
  name                = var.affinity_rule_infra
  compute_cluster_id  = data.vsphere_compute_cluster.cluster.id
  virtual_machine_ids = [data.vsphere_virtual_machine.ocp_infra.*.id]
}

resource "vsphere_compute_cluster_vm_affinity_rule" "cluster_rule_worker" {
  name                  = var.affinity_rule_worker
  compute_cluster_id    = data.vsphere_compute_cluster.cluster.id
  virtual_machineid_ids = [data.vsphere_virtual_machine.ocp_worker.*.id]
}
