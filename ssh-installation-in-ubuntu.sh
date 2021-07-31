#!/bin/bash

## install ssh package on ubuntu

sudo apt update -y

sudo apt install openssh-server -y

sudo systemctl start ssh

sudo systemctl enable ssh 

##Configure firewall and open port 22

sudo ufw allow ssh
sudo ufw enable
sudo ufw status

echo "successfully completed"


