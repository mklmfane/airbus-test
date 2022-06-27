# -*- mode: ruby -*-
# vi: set ft=ruby :

IMAGE_NAME = ENV["IMAGE_NAME"] || "ubuntu/bionic64"
MASTER_MEMORY = ENV["MASTER_CPUS"] || 2060
MASTER_CPUS = ENV["MASTER_CPUS"] || 2
WORKER_NODES = ENV["WORKER_NODES"] || 2
WORKER_MEMORY = ENV["WORKER_MEMORY"] || 1200
WORKER_CPUS = ENV["WORKER_CPUS"] || 2
BASE_IP = ENV["BASE_IP"] || "192.168.56"
KUBERNETES_VERSION= ENV["KUBERNETES_VERSION"] || "1.22.11-00"
# KUBERNETES_VERSION= ENV["KUBERNETES_VERSION"] || "1.20.6-00"

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  

  config.vm.define "k8s-master" do |master|
      master.vm.provider "virtualbox" do |v|
          v.memory = MASTER_MEMORY
          v.cpus = MASTER_CPUS
      end
      master.vm.box = IMAGE_NAME
      master.vm.network "private_network", ip: "#{BASE_IP}.#{10}"
      master.vm.hostname = "k8s-master"
      

      master.vm.provision "ansible" do |ansible|
          ansible.playbook = "kubernetes-setup/master-playbook.yaml"
          ansible.verbose = true
          ansible.extra_vars = {
            node_ip: "#{BASE_IP}.#{10}",
            kubernetes_version: KUBERNETES_VERSION,
          }
      end
  end

  (1..WORKER_NODES).each do |i|
      config.vm.define "node-#{i}" do |node|
          node.vm.provider "virtualbox" do |v|
            v.memory = WORKER_MEMORY
            v.cpus = WORKER_CPUS
          end
          node.vm.box = IMAGE_NAME
          node.vm.network "private_network", ip: "#{BASE_IP}.#{i + 1}"
          node.vm.hostname = "node-#{i}"
          node.vm.provision "ansible" do |ansible|
              ansible.playbook = "kubernetes-setup/node-playbook.yaml"
              ansible.verbose = true
              ansible.extra_vars = {
                  node_ip: "#{BASE_IP}.#{i + 1}",
                  kubernetes_version: KUBERNETES_VERSION,
              }
          end
      end
  end
  
  config.vm.define "jenkins" do |jenkins|
      jenkins.vm.provider "virtualbox" do |v|
          v.memory = 2600
          v.cpus = WORKER_CPUS 
      end
      
      jenkins.vm.hostname = "jenkins"
      jenkins.vm.box = IMAGE_NAME 
      jenkins.vm.network "private_network", ip: "192.168.56.25"
      jenkins.vm.network "forwarded_port", guest: 80, host: 8080
      
      
      jenkins.vm.provision "shell" do |shell|
          shell.path = "newjenkins/jenkins.sh"
      end
  end     
  
  config.vm.define "slave" do |jenkinss|
      jenkinss.vm.provider "virtualbox" do |v|
          v.memory = 2000
          v.cpus = WORKER_CPUS 
      end
      
      jenkinss.vm.hostname = "slave"
      jenkinss.vm.box = IMAGE_NAME 
      jenkinss.vm.network "private_network", ip: "192.168.56.26"
      
      jenkinss.vm.provision "shell" do |shell|
          shell.path = "newjenkins/jenkinsslave.sh"
      end
  end    
end
