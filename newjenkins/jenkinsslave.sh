#!/bin/bash
sudo apt-get update -y


sudo apt-get install -y \
     ca-certificates \
     curl \
     gnupg \
     lsb-release \
     openjdk-11-jdk \
     jq

echo  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo apt-get install -y docker-ce=18.06.3~ce~3-0~ubuntu docker-ce-cli=18.06.3~ce~3-0~ubuntu containerd.io docker-compose-plugin
sudo chmod 666 /var/run/docker.sock

sudo adduser jenkins --shell /bin/bash
sudo mkdir /home/jenkins/jenkins_slave
sudo mkdir /home/jenkins/jenkins_slave/.ssh
ssh-keygen -t rsa -C "The access key for Jenkins slaves"
cat id_rsa.pub > /home/jenkins/.ssh/authorized_keys
sudo usermod -a -G docker jenkins
echo finished!!
