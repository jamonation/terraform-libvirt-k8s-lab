resource "libvirt_volume" "os_image" {
  name   = "os_image"
  pool   = "default"
  source = var.image
}

resource "libvirt_volume" "volume-qcow2" {
  count          = var.number
  name           = "${var.volume-prefix}-${count.index + 2}.qcow2"
  base_volume_id = libvirt_volume.os_image.id
  pool           = "default"
  format         = "qcow2"
  size           = var.size
}

# Use CloudInit to add the instance
resource "libvirt_cloudinit_disk" "commoninit" {
  count = var.number
  name  = "${var.volume-prefix}.commoninit-${count.index}.iso"
  user_data = templatefile("../modules/k8s-control-plane/cloud_init.cfg", {
    hostname       = "k8s-controllers-${count.index + 2}"
    ssh-public-key = var.ssh-public-key
  })
  network_config = templatefile("../modules/k8s-control-plane/network_config.cfg", {
    ip_address  = "10.17.3.${count.index + 2}"
    netmask     = var.netmask
    gateway     = var.gateway
    nameservers = jsonencode(var.nameservers)
  })
}

resource "libvirt_domain" "k8s-controllers" {
  memory = var.memory
  vcpu   = var.vcpus
  count  = var.number
  name   = "k8s-controllers-${count.index + 2}"

  network_interface {
    network_name = "k8snet"
    hostname     = "k8s-controllers-${count.index + 2}"
  }

  disk {
    volume_id = libvirt_volume.volume-qcow2[count.index].id
  }

  cloudinit = libvirt_cloudinit_disk.commoninit[count.index].id

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
