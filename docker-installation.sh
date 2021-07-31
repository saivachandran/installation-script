#!/bin/bash

## update the latest package
 
sudo apt-get update  -y

## installrequire packages
 
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release  -y

## Add Docker’s official GPG key:

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


## Use the following command to set up the stable repository

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


##update the package

sudo apt-get update  -y

##install docker

sudo apt-get install docker-ce docker-ce-cli containerd.io -y


##run docker command without sudo

sudo groupadd docker

sudo usermod -aG docker $USER

