# terraform-vsphere-openshift

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| vsphere | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster | Name of Cluster | `string` | n/a | yes |
| datastore | Name of Datastore | `string` | n/a | yes |
| dc | Name of the datacenter | `string` | n/a | yes |
| prefix | Just prefix for hostname | `string` | `"mm2p"` | no |
| vm\_dns | dns server list | `list(string)` | <pre>[<br>  "1.1.1.1",<br>  "8.8.8.8"<br>]</pre> | no |
| vm\_domain | domain use in internal | `string` | `"opslab.tech"` | no |
| vms | vms - this variable contain vm spec and different vm type that you want to create | <pre>list(<br>    object({<br>      vm_type           = string<br>      num_of_vm         = number<br>      cpu_number        = number<br>      ram_size          = number<br>      vm_folder         = string<br>      vm_template       = string<br>      vm_rp             = string<br>      data_disk_label   = list(string)<br>      data_disk_size_gb = list(string)<br>      data_unit_number  = list(number)<br>      network_cards     = string<br>      ipv4_submask      = string<br>      ipv4_suffix       = number<br>      ipv4_prefix       = string<br>      ipv4_gateway      = string<br>    })<br>  )</pre> | <pre>[<br>  {<br>    "cpu_number": 4,<br>    "data_disk_label": [<br>      "disk_0",<br>      "disk_1"<br>    ],<br>    "data_disk_size_gb": [<br>      "85",<br>      "50"<br>    ],<br>    "data_unit_number": [<br>      0,<br>      1<br>    ],<br>    "ipv4_gateway": "10.15.23.245",<br>    "ipv4_prefix": "10.15.20.%s",<br>    "ipv4_submask": "22",<br>    "ipv4_suffix": 10,<br>    "network_cards": "pg-vlan103-ocp",<br>    "num_of_vm": 3,<br>    "ram_size": 8,<br>    "vm_folder": "openshift",<br>    "vm_rp": "rp-ocp-master",<br>    "vm_template": "template-redhatu-q2-ocp-master",<br>    "vm_type": "master"<br>  },<br>  {<br>    "cpu_number": 4,<br>    "data_disk_label": [<br>      "disk_0",<br>      "disk_1"<br>    ],<br>    "data_disk_size_gb": [<br>      "85",<br>      "50"<br>    ],<br>    "data_unit_number": [<br>      0,<br>      1<br>    ],<br>    "ipv4_gateway": "10.15.23.245",<br>    "ipv4_prefix": "10.15.20.%s",<br>    "ipv4_submask": "22",<br>    "ipv4_suffix": 20,<br>    "network_cards": "pg-vlan102-ocp",<br>    "num_of_vm": 4,<br>    "ram_size": 8,<br>    "vm_folder": "openshift",<br>    "vm_rp": "rp-ocp-infra",<br>    "vm_template": "template-redhat7-q2-ocp-infra",<br>    "vm_type": "infra"<br>  },<br>  {<br>    "cpu_number": 12,<br>    "data_disk_label": [<br>      "disk_0",<br>      "disk_1"<br>    ],<br>    "data_disk_size_gb": [<br>      "165",<br>      "250"<br>    ],<br>    "data_unit_number": [<br>      0,<br>      1<br>    ],<br>    "ipv4_gateway": "10.15.23.245",<br>    "ipv4_prefix": "10.15.20.%s",<br>    "ipv4_submask": "22",<br>    "ipv4_suffix": 100,<br>    "network_cards": "pg-vlan101-ocp",<br>    "num_of_vm": 10,<br>    "ram_size": 64,<br>    "vm_folder": "openshift",<br>    "vm_rp": "rp-ocp-worker",<br>    "vm_template": "template-redhat7-q2-ocp-worker",<br>    "vm_type": "worker"<br>  }<br>]</pre> | no |

## Outputs

No output.
