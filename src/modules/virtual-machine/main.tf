resource "azurerm_public_ip" "pip-02" {
  name                = var.virtual_machine_public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.virtual_machine_public_ip_allocation_method
  sku                 = var.virtual_machine_public_ip_sku
  ip_version          = var.virtual_machine_public_ip_version

  tags = {
    State = "Terraform"
  }
}

resource "azurerm_network_interface" "nic-01" {
  name                = var.virtual_machine_network_interface_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.virtual_machine_network_interface_ip_configuration_name
    subnet_id                     = var.virtual_machine_network_interface_ip_configuration_subnet_id
    private_ip_address_allocation = var.virtual_machine_network_interface_ip_configuration_private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.pip-02.id
  }

  tags = {
    State = "Terraform"
  }
}

resource "azurerm_linux_virtual_machine" "vm-01" {
  name                = var.virtual_machine_name
  resource_group_name = azurerm_network_interface.nic-01.resource_group_name
  location            = azurerm_network_interface.nic-01.location
  size                = var.virtual_machine_size
  computer_name       = var.virtual_machine_computer_name
  admin_username      = var.virtual_machine_admin_username
  network_interface_ids = [
    azurerm_network_interface.nic-01.id
  ]

  admin_ssh_key {
    username   = var.virtual_machine_admin_username
    public_key = var.virtual_machine_admin_ssh_key_public_key
  }

  os_disk {
    name                 = var.virtual_machine_os_disk_name
    caching              = var.virtual_machine_os_disk_caching
    storage_account_type = var.virtual_machine_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.virtual_machine_source_image_reference_publisher
    offer     = var.virtual_machine_source_image_reference_offer
    sku       = var.virtual_machine_source_image_reference_sku
    version   = var.virtual_machine_source_image_reference_version
  }

  tags = {
    State = "Terraform"
  }
}
