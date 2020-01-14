output "linux_vm_public_name" {
  value = "${module.linuxservers.public_ip_dns_name}"
}

output "linux_vm_public_ip" {
  value = "${module.linuxservers.public_ip_address}"
}

output "linux_vm_private_ips" {
  value = "${module.linuxservers.network_interface_private_ip}"
}
