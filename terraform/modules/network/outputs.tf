output "ip_addresses" {
  value = libvirt_network.kube_network.addresses
}

output "network_id" {
  value = libvirt_network.kube_network.id
}
