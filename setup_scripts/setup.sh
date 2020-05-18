#!/bin/bash


sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add - 
    
sudo add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main"

sudo apt-get update
sudo apt-get -y install docker.io
# add current user to docker group so there is no need to use sudo when running docker
sudo usermod -aG docker $(whoami)


#You would need to loog out and log back in so that your group membership is re-evaluated or type the following command:

echo "Docker Installed"
docker --version
