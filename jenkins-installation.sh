#!/bin/bash


#Installation of Java

sudo apt update -y

sudo apt install openjdk-11-jdk -y

# jenkins installation

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install jenkins -y







