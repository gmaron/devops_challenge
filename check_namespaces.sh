#!/bin/bash

echo "===============> SWITCH OFF SWAP"
sudo swapoff -a

python3 ./k8s.py