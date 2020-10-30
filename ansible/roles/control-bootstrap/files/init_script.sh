#!/bin/bash

kubeadm init --control-plane-endpoint '10.17.3.254:8080' --upload-certs --ignore-preflight-errors=DirAvailable--etc-kubernetes-manifests | grep -B2 '\-\-control-plane'

#printf "$BOOTSTRAP_CMD --ignore-preflight-errors=DirAvailable--etc-kubernetes-manifests"
