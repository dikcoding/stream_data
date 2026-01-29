#!/bin/bash

# Run using:
# bash vm_setup.sh

set -e

echo "=== Downloading Anaconda ==="
wget -q https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh

echo "=== Installing Anaconda ==="
bash Anaconda3-2021.11-Linux-x86_64.sh -b -p $HOME/anaconda

echo "=== Cleaning installer ==="
rm Anaconda3-2021.11-Linux-x86_64.sh

# Activate conda
eval "$($HOME/anaconda/bin/conda shell.bash hook)"

echo "=== Initializing conda ==="
conda init
conda update -y conda

echo "=== Conda version ==="
conda --version

echo "=== Updating apt ==="
sudo apt-get update -y

echo "=== Installing Docker ==="
sudo apt-get install -y docker.io

echo "=== Enabling Docker without sudo ==="
sudo groupadd docker || true
sudo usermod -aG docker $USER
sudo service docker restart

echo "=== Installing docker-compose (v1 legacy) ==="
sudo apt-get install -y docker-compose

echo "=== Docker versions ==="
docker --version
docker-compose --version

echo "=== Creating Google credentials directory ==="
mkdir -p ~/.google/credentials

echo "=== Setup complete ==="
echo "IMPORTANT: logout/login or run 'newgrp docker' before using docker"