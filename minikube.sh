#!/bin/bash
echo "Applying Updates"
sudo apt update -y
sudo apt upgrade -y
echo "Install prerequisites packages for docker"
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
echo "Setup docker official repository"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "Install docker with apt command"
sudo apt install docker-ce -y
echo "add your local user to docker group"
sudo usermod -aG docker devopsadmin
echo "Verify the Docker version "
docker version
echo "Install Minikube dependencies"
sudo apt install -y curl wget apt-transport-https
echo "Download Minikube Binary"
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
echo "Checking minikube version"
minikube version
echo "Install Kubectl utility"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
echo "set the executable permissions on kubectl binary"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
echo "verify the kubectl version"
kubectl version -o yaml
echo "Start the minikube"
minikube start --driver=docker


