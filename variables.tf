variable "location" {
  default     = "westus"
  description = "Location/region to deploy resources"
}

variable "resource_group_name" {
  description = "Resource group name for virtual machines"
}

variable "vnet_resource_group_name" {
  description = "Resource group name for shared network resources"
}

variable "vnet_name" {
  default     = "shared-vnet"
  description = "Virtual network name"
}

variable "subnet_name" {
  default     = "subnet1"
  description = "Subnet name"
}

variable "vm_hostname" {
  default     = "linux-test"
  description = "Hostname for virtual machine"
}

variable "vm_size" {
  default     = "Standard_DS1_V2"
  description = "Virtual machine instance size"
}

variable "ssh_key" {
  default     = "id_rsa.pub"
  description = "SSH public key file path"
}
