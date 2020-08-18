locals {
  hosts = flatten([for vm in var.vms : [
    for a in range(vm.num_of_vm) : {
      name        = format("%s%s", vm.vm_type, format("%02d", a + 1))
      cpu         = vm.cpu_number
      ram         = vm.ram_size
      disk_label  = vm.data_disk_label
      disk_size   = vm.data_disk_size_gb
      unit_num    = vm.data_unit_number
      net_cards   = vm.network_cards
      subnet      = vm.ipv4_submask
      gateway     = vm.ipv4_gateway
      ip          = format(vm.ipv4_prefix, vm.ipv4_suffix + a + 1)
      vm_template = vm.vm_template
      vm_folder   = vm.vm_folder
      vm_rp       = vm.vm_rp
    }
    ]
  ])
}

resource "vsphere_virtual_machine" "machine" {
  count            = length(local.hosts)
  name             = format("%s-%s.%s", var.prefix, local.hosts[count.index].name, var.vm_domain)
  resource_pool_id = data.vsphere_resource_pool.pool[count.index].id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = local.hosts[count.index].vm_folder

  num_cpus         = local.hosts[count.index].cpu
  memory           = local.hosts[count.index].ram
  guest_id         = data.vsphere_virtual_machine.template[count.index].guest_id
  enable_disk_uuid = true

  network_interface {
    network_id = data.vsphere_network.network[count.index].id
  }

  dynamic "disk" {
    for_each = local.hosts[count.index].disk_size
    iterator = terraform_disks
    content {
      label            = local.hosts[count.index].disk_label[terraform_disks.key]
      size             = local.hosts[count.index].disk_size[terraform_disks.key]
      unit_number      = local.hosts[count.index].unit_num[terraform_disks.key]
      thin_provisioned = data.vsphere_virtual_machine.template[count.index].disks.0.thin_provisioned
      datastore_id     = data.vsphere_datastore.datastore.id
    }
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template[count.index].id

    customize {
      linux_options {
        host_name = format("%s-%s", var.prefix, local.hosts[count.index].name)
        domain    = var.vm_domain
      }

      network_interface {
        ipv4_address = local.hosts[count.index].ip
        ipv4_netmask = local.hosts[count.index].subnet
      }
      dns_server_list = var.vm_dns
      ipv4_gateway    = local.hosts[count.index].gateway
    }
  }
}
