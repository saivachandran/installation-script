#!/bin/bash

# Update package manager
sudo apt update -y

# Install dependencies
sudo apt install -y unzip

# Download AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip package
unzip awscliv2.zip

# Run installation script
sudo ./aws/install

# Verify installation
aws --version
