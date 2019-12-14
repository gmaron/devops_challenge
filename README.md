
# DevOps Challenge

As developer, I want to launch a local Kubernetes development environment automatically using kubeadm. I expect to create my environment running "vagrant up", and after that I must be able to login into the Vagrant VM and run kubectl commands.

Include a simple Python script that list all the running pods in all the namespaces. Call this script at the end of `vagrant up` or `provision` process to validate Kubernetes installation.

## How it is solve

At this first solution, it executes a `bash` script with a simple step-by-step  linux commands. It install and setup all the necessary dependencies such as Docker, Kubernetes (`kubectl` and `kubeadm`) and Python dependencie of `kubernetes`.

The main file is `/home/vagrant/.kube/config` without this file nothing works. I have to put it into a environment var in `/etc/profile.d/kube_envvars.sh` to setup when `vagrant up` command is executed.

## Prerequisites

1. You must have instaled [virtualbox](https://www.virtualbox.org/wiki/Downloads)
1. You must have installed [vagrant](https://www.vagrantup.com/downloads.html)

Check if everything is ok executing `vagrant version`

## Reproduce the challenge

1. Just only execute `vagrant up --provision` or `vagrant up`

In the end, you should see a list with namespaces in JSON format.

## Double check of `kubectl` is working

1. Execute `vagrant ssh`
2. Execute `kubectl get nodes`

You should see:

```
vagrant@master-node:~$ kubectl get nodes
NAME          STATUS     ROLES    AGE   VERSION
master-node   NotReady   master   64s   v1.17.0
```