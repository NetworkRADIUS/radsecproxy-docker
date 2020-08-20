#!/bin/bash


sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common 
curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add - 
    
sudo add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main"

sudo apt-get update
sudo apt-get -y install tree
sudo apt-get -y install docker.io
# add current user to docker group so there is no need to use sudo when running docker
sudo usermod -aG docker $(whoami)

echo "Docker Installed"
if  ! sudo docker --version;
then
    echo "Failed to install Docker"
    exit 1
fi


if  ! sudo docker info;
then
    echo "Docker Daemon is not Running"
    echo "Starting Docker Daemon"
    sudo systemctl start docker
    echo "Installation Completed"
else
    echo "Installation Completed"
fi
