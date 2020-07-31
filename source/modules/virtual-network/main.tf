resource "azurerm_virtual_network" "vnet-01" {
  name                = var.virtual_network_hub_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_hub_address_space
  dns_servers         = var.virtual_network_hub_dns_servers

  tags = {
    State = "Terraform"
  }
}

resource "azurerm_subnet" "subnet-01" {
  name                 = var.virtual_network_hub_subnet01_name
  resource_group_name  = azurerm_virtual_network.vnet-01.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefix       = var.virtual_network_hub_subnet01_address_prefix
}

resource "azurerm_network_security_group" "nsg-01" {
  name                = var.virtual_network_hub_subnet01_network_security_group_name
  location            = azurerm_virtual_network.vnet-01.location
  resource_group_name = azurerm_virtual_network.vnet-01.resource_group_name

  tags = {
    State = "Terraform"
  }
}

resource "azurerm_subnet_network_security_group_association" "assc-01" {
  subnet_id                 = azurerm_subnet.subnet-01.id
  network_security_group_id = azurerm_network_security_group.nsg-01.id
}

resource "azurerm_virtual_network" "vnet-02" {
  name                = var.virtual_network_spoke01_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_spoke01_address_space
  dns_servers         = var.virtual_network_spoke01_dns_servers

  tags = {
    State = "Terraform"
  }
}

resource "azurerm_subnet" "subnet-02" {
  name                 = var.virtual_network_spoke01_subnet01_name
  resource_group_name  = azurerm_virtual_network.vnet-02.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-02.name
  address_prefix       = var.virtual_network_spoke01_subnet01_address_prefix
}

resource "azurerm_network_security_group" "nsg-02" {
  name                = var.virtual_network_spoke01_subnet01_network_security_group_name
  location            = azurerm_virtual_network.vnet-02.location
  resource_group_name = azurerm_virtual_network.vnet-02.resource_group_name

  tags = {
    State = "Terraform"
  }
}

resource "azurerm_network_security_rule" "nsr-01" {
  name                        = "AllowSSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "77.169.37.43"
  destination_address_prefix  = "10.1.1.0/24"
  resource_group_name         = azurerm_network_security_group.nsg-02.resource_group_name
  network_security_group_name = azurerm_network_security_group.nsg-02.name
}

resource "azurerm_subnet_network_security_group_association" "assc-02" {
  subnet_id                 = azurerm_subnet.subnet-02.id
  network_security_group_id = azurerm_network_security_group.nsg-02.id
}

resource "azurerm_virtual_network_peering" "peer-01" {
  name                      = var.virtual_network_hub_spoke01_peering
  resource_group_name       = azurerm_virtual_network.vnet-01.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet-01.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-02.id
  allow_forwarded_traffic   = var.virtual_network_hub_spoke01_peering_allow_forwarded_traffic
}

resource "azurerm_virtual_network_peering" "peer-02" {
  name                      = var.virtual_network_spoke01_hub_peering
  resource_group_name       = azurerm_virtual_network.vnet-01.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet-02.name
  remote_virtual_network_id = azurerm_virtual_network.vnet-01.id
  allow_forwarded_traffic   = var.virtual_network_spoke01_hub_peering_allow_forwarded_traffic
}
