variable "dc" {
  type        = string
  description = "Name of the datacenter"
}

variable "cluster" {
  type        = string
  description = "Name of Cluster"
}

variable "num_of_esxi_host" {
  type        = number
  description = "Total number of esxi host in cluster"
}

variable "prefix" {
  type        = string
  description = "VM name prefix"
  default     = "mm2p"
}

variable "suffix_domain" {
  type        = string
  description = "VM name suffix"
  default     = "ascendmoney.internal"
}

variable "num_of_master" {
  type        = number
  description = "Total number of openshift master VM"
}

variable "num_of_infra" {
  type        = number
  description = "Total number of openshift infra VM"
}

variable "num_of_worker" {
  type        = number
  description = "Total number of openshift worker VM"
}

variable "affinity_rule_master" {
  type        = string
  default     = "cluster-rule-master"
  description = "Name of affinity rule for openshift master VM"
}

variable "affinity_rule_infra" {
  type        = string
  default     = "cluster-rule-infra"
  description = "Name of affinity rule for openshift infra VM"
}

variable "affinity_rule_worker" {
  type        = string
  default     = "cluster-rule-worker"
  description = "Name of affinity rule for openshift worker VM"
}
