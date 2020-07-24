resource "azurerm_resource_group" "rg-01" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    State = "Terraform"
  }
}
