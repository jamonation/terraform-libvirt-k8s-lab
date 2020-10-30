output "ip_addresses" {
  value = {
    for vm in libvirt_domain.k8s-controllers :
    vm.name => vm.network_interface.*.addresses
  }
}

output "user_data" {
  value = {
    for data in libvirt_cloudinit_disk.commoninit :
    data.id => data.user_data
  }
}
