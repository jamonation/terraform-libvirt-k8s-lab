output "ip_addresses" {
  value = {
    for vm in libvirt_domain.k8s-controllers:
    vm.name => vm.network_interface.*.addresses[0]
  }
}

#output "user_data" {
#  value = {
#    for data in libvirt_cloudinit_disk.commoninit :
#    data.id => data.user_data
#  }
#}

#output "network_config" {
#  value = {
#    for data in libvirt_cloudinit_disk.commoninit :
#    data.id => data.network_config
#  }
#}
