# Terraform + libvirt + Ansible = HA Kubernetes Lab

![Image](https://jamon.ca/terraform-libvirt-k8s-lab.png)

## Introduction

A home lab is a great way to explore and learn about different tools, architectures, and development methods.

The idea is to use Terraform and Ansible to build a local Kubernetes cluster that is more extensible, and closer to a production architecture than many of the typical single-machine example environments.

## About

This repository contains all the Terraform modules and Ansible roles that you need to build a local [High Availability Kubernetes cluster](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/ha-topology/) that you can experiment with using KVM locally.

The Terraform modules use the [`libvirt` terraform provider](https://github.com/dmacvicar/terraform-provider-libvirt) tp provision a virtual network and virtual machines, so you'll need to be running `libvirtd` on Linux to be able to use this repository.

The stacked Kubernetes control plane is managed using (HAProxy and Keepalived)[https://github.com/kubernetes/kubeadm/blob/master/docs/ha-considerations.md#keepalived-and-haproxy] running as static pods on the control plane VMs.

## Requirements

To use this repository you will need the following on your local machine:

* Linux
* Ansible
* Terraform >= v0.13
* libvirt with a `default` storage pool - the [`network module`](https://github.com/jamonation/terraform-libvirt-k8s-lab/tree/main/terraform/modules/network) in this repository will define a network for you
* [terraform-provider-libvirt](https://github.com/dmacvicar/terraform-provider-libvirt) - make sure to install the plugin in `~/.local/share/terraform/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.2/linux_amd64/terraform-provider-libvirt`
* Enough CPU, RAM, and disk space to run two libvirt guests - the more the better!

## Using this repository

Running `terraform apply` with no variable arguments will create 5 Kubernetes nodes - 3 control plane, and 2 nodes for workloads. Each will use 2 CPUs, and have 2GB of RAM allocated.

Once the VMs are up, running `ansible-playbook -i hosts bootstrap.yaml` in the `ansible` directory will bootstrap the Kubernetes control plane on one VM. The role will also generate a token for other `control-plane` nodes and will use that on the remaining nodes to join them to the cluster

using a virtual IP that is managed by HAProxy and Keepalived.

## Helpful resources, kudos, and credits

[How To Provision VMs on KVM with Terraform](https://computingforgeeks.com/how-to-provision-vms-on-kvm-with-terraform/) - a great resource to consult if you're just getting started with Terraform and KVM.

[Using the Libvirt Provisioner With Terraform for KVM](https://blog.ruanbekker.com/blog/2020/10/08/using-the-libvirt-provisioner-with-terraform-for-kvm/) - a more advanced example than the first

[
Dynamic Cloud-Init Content with Terraform File Templates
](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/) - templating `cloud-init` data wouldn't have been possible without this invaluable explanation.

The [`terraform-provider-libvirt` documentation](https://github.com/dmacvicar/terraform-provider-libvirt) of course!

[How To Create a Kubernetes Cluster Using Kubeadm on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-ubuntu-18-04) - this tutorial formed the basis for the Ansible roles
