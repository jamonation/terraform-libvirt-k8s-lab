variable "control-vcpus" {
  description = "How many vcpus to allocate to the VM"
  type = number
  default = 1
}

variable "control-memory" {
  description = "How many MBs of RAM to allocate to the VM"
  type = number
  default = 512
}

variable "control-number" {
  description = "How many machines to create"
  type = number
  default = 1
}

variable "control-volume-size" {
  description = "How large a root disk volume (default 25GB)"
  type = number
  default = 26806965760
}

variable "control-image" {
  description = "Which qcow2 image to use for the base OS"
  type = string
  default = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
}

variable "control-volume-prefix" {
  description = "Prefix for volume names e.g. k8s-node..."
  default = "k8s"
  type = string
}

variable "nodes-vcpus" {
  description = "How many vcpus to allocate to the VM"
  type = number
  default = 1
}

variable "nodes-memory" {
  description = "How many MBs of RAM to allocate to the VM"
  type = number
  default = 512
}

variable "nodes-number" {
  description = "How many machines to create"
  type = number
  default = 1
}

variable "nodes-volume-size" {
  description = "How large a root disk volume (default 25GB)"
  type = number
  default = 26806965760
}

variable "nodes-image" {
  description = "Which qcow2 image to use for the base OS"
  type = string
  default = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
}

variable "nodes-volume-prefix" {
  description = "Prefix for volume names e.g. k8s-node..."
  default = "k8s"
  type = string
}

variable "ssh-public-key" {
  description = "ssh-rsa key for terraform-libvirt user"
  default = ""
}
