terraform {
  backend "azurerm" {
    resource_group_name  = <resource group>
    storage_account_name = <storage account>
    container_name       = "tfstate"
    key                  = "terraform.state"
  }
}

provider azurerm {
  version         = "2.0.0"
  subscription_id = var.subscription_id

  features {}
}

module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
}

module "virtual_network" {
  source = "./modules/virtual-network"

  resource_group_name                                          = module.resource_group.name
  location                                                     = module.resource_group.location
  virtual_network_hub_name                                     = var.virtual_network_hub_name
  virtual_network_hub_address_space                            = var.virtual_network_hub_address_space
  virtual_network_hub_dns_servers                              = var.virtual_network_hub_dns_servers
  virtual_network_hub_subnet01_name                            = var.virtual_network_hub_subnet01_name
  virtual_network_hub_subnet01_address_prefix                  = var.virtual_network_hub_subnet01_address_prefix
  virtual_network_hub_subnet01_network_security_group_name     = var.virtual_network_hub_subnet01_network_security_group_name
  virtual_network_spoke01_name                                 = var.virtual_network_spoke01_name
  virtual_network_spoke01_address_space                        = var.virtual_network_spoke01_address_space
  virtual_network_spoke01_dns_servers                          = var.virtual_network_spoke01_dns_servers
  virtual_network_spoke01_subnet01_name                        = var.virtual_network_spoke01_subnet01_name
  virtual_network_spoke01_subnet01_address_prefix              = var.virtual_network_spoke01_subnet01_address_prefix
  virtual_network_spoke01_subnet01_network_security_group_name = var.virtual_network_spoke01_subnet01_network_security_group_name
  virtual_network_hub_spoke01_peering                          = var.virtual_network_hub_spoke01_peering
  virtual_network_hub_spoke01_peering_allow_forwarded_traffic  = var.virtual_network_hub_spoke01_peering_allow_forwarded_traffic
  virtual_network_spoke01_hub_peering                          = var.virtual_network_spoke01_hub_peering
  virtual_network_spoke01_hub_peering_allow_forwarded_traffic  = var.virtual_network_spoke01_hub_peering_allow_forwarded_traffic
}

module "virtual_machine" {
  source = "./modules/virtual-machine"

  resource_group_name                                                              = module.resource_group.name
  location                                                                         = module.resource_group.location
  virtual_machine_public_ip_name                                                   = var.virtual_machine_public_ip_name
  virtual_machine_public_ip_allocation_method                                      = var.virtual_machine_public_ip_allocation_method
  virtual_machine_public_ip_sku                                                    = var.virtual_machine_public_ip_sku
  virtual_machine_public_ip_version                                                = var.virtual_machine_public_ip_version
  virtual_machine_network_interface_name                                           = var.virtual_machine_network_interface_name
  virtual_machine_network_interface_ip_configuration_name                          = var.virtual_machine_network_interface_ip_configuration_name
  virtual_machine_network_interface_ip_configuration_subnet_id                     = module.virtual_network.subnet02_id
  virtual_machine_network_interface_ip_configuration_private_ip_address_allocation = var.virtual_machine_network_interface_ip_configuration_private_ip_address_allocation
  virtual_machine_name                                                             = var.virtual_machine_name
  virtual_machine_size                                                             = var.virtual_machine_size
  virtual_machine_admin_username                                                   = var.virtual_machine_admin_username
  virtual_machine_admin_ssh_key_public_key                                         = var.virtual_machine_admin_ssh_key_public_key
  virtual_machine_os_disk_name                                                     = var.virtual_machine_os_disk_name
  virtual_machine_os_disk_caching                                                  = var.virtual_machine_os_disk_caching
  virtual_machine_os_disk_storage_account_type                                     = var.virtual_machine_os_disk_storage_account_type
  virtual_machine_source_image_reference_publisher                                 = var.virtual_machine_source_image_reference_publisher
  virtual_machine_source_image_reference_offer                                     = var.virtual_machine_source_image_reference_offer
  virtual_machine_source_image_reference_sku                                       = var.virtual_machine_source_image_reference_sku
  virtual_machine_source_image_reference_version                                   = var.virtual_machine_source_image_reference_version
}
