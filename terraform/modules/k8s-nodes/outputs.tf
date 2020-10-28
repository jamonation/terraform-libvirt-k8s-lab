output "ip_addresses" {
  value = {
    for vm in libvirt_domain.k8s-nodes:
      vm.name => vm.network_interface.*.addresses
  }
}
