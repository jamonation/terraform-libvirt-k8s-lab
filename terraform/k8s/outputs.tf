#output "control-plane-ip_addresses" {
#  value       = module.k8s-control-plane.ip_addresses
#  description = "IPv4 address of k8s-control-plane"
#}

#output "node-ip_addresses" {
#  value       = module.k8s-nodes.ip_addresses
#  description = "IPv4 address of k8s-nodes"
#}

output "userdata" {
  value = module.k8s-control-plane.user_data
}
