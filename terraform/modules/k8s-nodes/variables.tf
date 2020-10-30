variable "vcpus" {
  description = "How many vcpus to allocate to the VM"
  type = number
  default = 1
}

variable "memory" {
  description = "How many MBs to allocate to the VM"
  type = number
  default = 512
}

variable "number" {
  description = "How many machines to create"
  type = number
  default = 1
}

variable "size" {
  description = "How large a root disk volume (default 25GB)"
  type = number
  default = 26806965760
}

variable "image" {
  description = "Which qcow2 image to use for the base OS"
  type = string
  default = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
}

variable "volume-prefix" {
  description = "Prefix for volume names e.g. ubuntu-haproxy-..."
  default = "haproxy"
  type = string
}

variable "network_id" {
  description = "UUID of network for k8s control-plane and nodes"
  type = string
}

variable "netmask" {
  description = "Netmask for k8snet"
  type = string
  default = "24"
}

variable "gateway" {
  description = "Gateway for k8snet"
  type = string
  default = "10.17.3.1"
}

variable "nameservers" {
  description = "Resolvers for k8snet"
  type = list
  default = ["10.0.0.10","1.1.1.1"]
}

variable "ssh-public-key" {
  description = "ssh-rsa key for terraform-libvirt user"
  default = ""
}
