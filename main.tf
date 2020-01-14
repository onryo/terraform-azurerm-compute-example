resource "random_string" "hostname_suffix" {
  length  = 4
  upper   = false
  lower   = true
  number  = false
  special = false
}

data "azurerm_subnet" "compute_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_resource_group_name
}

locals {
  vm_hostname = "${var.vm_hostname}-${random_string.hostname_suffix.result}"
}

module "linuxservers" {
  source = "Azure/compute/azurerm"

  resource_group_name           = var.resource_group_name
  location                      = var.location
  vm_hostname                   = local.vm_hostname
  nb_public_ip                  = 1
  public_ip_dns                 = [local.vm_hostname]
  remote_port                   = 22
  nb_instances                  = 1
  vm_os_publisher               = "Canonical"
  vm_os_offer                   = "UbuntuServer"
  vm_os_sku                     = "16.04-LTS"
  vnet_subnet_id                = data.azurerm_subnet.compute_subnet.id
  boot_diagnostics              = false
  delete_os_disk_on_termination = true
  data_disk                     = true
  data_disk_size_gb             = 64
  data_sa_type                  = "Standard_LRS"

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  enable_accelerated_networking = "false"
}
