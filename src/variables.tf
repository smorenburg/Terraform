variable "subscription_id" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
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

variable "virtual_machine_public_ip_name" {
  type = string
}

variable "virtual_machine_public_ip_allocation_method" {
  type = string
}

variable "virtual_machine_public_ip_sku" {
  type = string
}

variable "virtual_machine_public_ip_version" {
  type = string
}

variable "virtual_machine_network_interface_name" {
  type = string
}

variable "virtual_machine_network_interface_ip_configuration_name" {
  type = string
}

variable "virtual_machine_network_interface_ip_configuration_private_ip_address_allocation" {
  type = string
}

variable "virtual_machine_name" {
  type = string
}

variable "virtual_machine_size" {
  type = string
}

variable "virtual_machine_admin_username" {
  type = string
}

variable "virtual_machine_admin_ssh_key_public_key" {
  type = string
}

variable "virtual_machine_os_disk_name" {
  type = string
}

variable "virtual_machine_os_disk_caching" {
  type = string
}

variable "virtual_machine_os_disk_storage_account_type" {
  type = string
}

variable "virtual_machine_source_image_reference_publisher" {
  type = string
}

variable "virtual_machine_source_image_reference_offer" {
  type = string
}

variable "virtual_machine_source_image_reference_sku" {
  type = string
}

variable "virtual_machine_source_image_reference_version" {
  type = string
}
