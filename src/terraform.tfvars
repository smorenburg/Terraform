# Default
subscription_id = <subscription id>
location        = "westeurope"

# Resource Group
resource_group_name = "core-rg-01"

# Virtual Network
virtual_network_hub_name                                     = "core-vnet-hub"
virtual_network_hub_address_space                            = ["10.0.0.0/22"]
virtual_network_hub_dns_servers                              = ["8.8.8.8", "8.8.4.4"]
virtual_network_hub_subnet01_name                            = "default"
virtual_network_hub_subnet01_address_prefix                  = "10.0.1.0/24"
virtual_network_hub_subnet01_network_security_group_name     = "core-vnet-hub-nsg-default"
virtual_network_spoke01_name                                 = "core-vnet-spoke-01"
virtual_network_spoke01_address_space                        = ["10.1.0.0/22"]
virtual_network_spoke01_dns_servers                          = ["8.8.8.8", "8.8.4.4"]
virtual_network_spoke01_subnet01_name                        = "default"
virtual_network_spoke01_subnet01_address_prefix              = "10.1.1.0/24"
virtual_network_spoke01_subnet01_network_security_group_name = "core-vnet-spoke-01-nsg-default"
virtual_network_hub_spoke01_peering                          = "hub-101_spoke-01"
virtual_network_hub_spoke01_peering_allow_forwarded_traffic  = true
virtual_network_spoke01_hub_peering                          = "spoke-101_hub-01"
virtual_network_spoke01_hub_peering_allow_forwarded_traffic  = true

# Virtual Machine
virtual_machine_public_ip_name                                                   = "ubuntu-01-nic-01-pip-01"
virtual_machine_public_ip_allocation_method                                      = "Static"
virtual_machine_public_ip_sku                                                    = "Standard"
virtual_machine_public_ip_version                                                = "IPv4"
virtual_machine_network_interface_name                                           = "ubuntu-01-nic-01"
virtual_machine_network_interface_ip_configuration_name                          = "default"
virtual_machine_network_interface_ip_configuration_private_ip_address_allocation = "Dynamic"
virtual_machine_name                                                             = "ubuntu-01"
virtual_machine_size                                                             = "Standard_DS1_v2"
virtual_machine_admin_username                                                   = "smorenburg"
virtual_machine_admin_ssh_key_public_key                                         = <ssh key>
virtual_machine_os_disk_name                                                     = "ubuntu-01-disk-01"
virtual_machine_os_disk_caching                                                  = "ReadWrite"
virtual_machine_os_disk_storage_account_type                                     = "Standard_LRS"
virtual_machine_source_image_reference_publisher                                 = "Canonical"
virtual_machine_source_image_reference_offer                                     = "UbuntuServer"
virtual_machine_source_image_reference_sku                                       = "18.04-LTS"
virtual_machine_source_image_reference_version                                   = "latest"
