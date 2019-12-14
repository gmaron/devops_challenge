#!/bin/bash


echo "===============> INSTALL LINUX DEPENDENCIES"
sudo apt-get update
sudo apt-get install docker.io curl python3-pip -y
sudo systemctl enable docker

echo "===============> ADD K8S REPO"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

echo "===============> INSTALL K8S"
sudo apt-get install kubeadm -y

echo "===============> SWITCH OFF SWAP"
sudo swapoff -a

echo "===============> CONFIG K8S"
sudo hostnamectl set-hostname master-node
sudo kubeadm config images pull

echo "===============> START UP KUBEADM"
sudo kubeadm init --pod-network-cidr=192.168.50.0/16


echo "===============> SETUP K8S CONFIG"
sudo mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config

echo "===============> INSTALL K8S PYTHON DEP"
pip3 install kubernetes

# echo "===============> LIST NAMESPACES"
# python3 /home/vagrant/k8s.py