#!/bin/bash
apt-get update
apt-get install -y openjdk-11-jdk

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

echo installing Jenkins...
apt-get update
apt-get install -y jenkins

echo installing Node and Yarn...
apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install -y yarn

sleep 1m

systemctl status jenkins

JENKINSPWD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo JENKINSPWD=$JENKINSPWD

echo finished!!
