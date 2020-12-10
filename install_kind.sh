#!/bin/bash
set -e

clear
echo 'This script will download and set up KinD:'

# Download the latest version of KinD
curl -Lo ./kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-linux-amd64

# Make the binary executable
chmod a+x ./kind

# Move the binary to your executable path
sudo mv ./kind /usr/local/bin/

clear
echo 'SUCCESS: KinD installed'
kind version