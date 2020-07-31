variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_network_hub_name" {
  type = string
}

variable "virtual_network_hub_address_space" {
  type = list
}

variable "virtual_network_hub_dns_servers" {
  type = list
}

variable "virtual_network_hub_subnet01_name" {
  type = string
}

variable "virtual_network_hub_subnet01_address_prefix" {
  type = string
}

variable "virtual_network_hub_subnet01_network_security_group_name" {
  type = string
}

variable "virtual_network_spoke01_name" {
  type = string
}

variable "virtual_network_spoke01_address_space" {
  type = list
}

variable "virtual_network_spoke01_dns_servers" {
  type = list
}

variable "virtual_network_spoke01_subnet01_name" {
  type = string
}

variable "virtual_network_spoke01_subnet01_address_prefix" {
  type = string
}

variable "virtual_network_spoke01_subnet01_network_security_group_name" {
  type = string
}

variable "virtual_network_hub_spoke01_peering" {
  type = string
}

variable "virtual_network_hub_spoke01_peering_allow_forwarded_traffic" {
  type = bool
}

variable "virtual_network_spoke01_hub_peering" {
  type = string
}

variable "virtual_network_spoke01_hub_peering_allow_forwarded_traffic" {
  type = bool
}
