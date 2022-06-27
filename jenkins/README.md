# Jenkins on Vagrant

Simple demonstration of Jenkins provisioned on Vagrant (VirtualBox). 

## Getting Started

Clone [repository](https://github.com/lbytnar/vagrant-jenkins) or unpack archive. 
You should have the following directory structure
```
.
├── Vagrantfile
├── ansible.cfg
├── playbook.yml
└── requirements.yml
```

### Prerequisites

For this demonstration you need:
* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)

Ansible will automatically download and install two roles:
```
  - geerlingguy.java        - installs Java JDK which is requred for Jenkins
  - geerlingguy.jenkins     - installs and configures Jenkins with few plugins (e.g. pipelines)
```

### Installing

Depending on your OS, you can install required packages with package manager. 
e.g. on Ubuntu/Debian based type
```
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```
to install ansible.

More information with the links can be found in the `prerequisites` section. 

## Running

In the vagrant-jenkins directory, run `vagrant up`. It will provision VirtualBox machine and then use Ansible to configure the latest Jenkins with the following plugins:
```
  - pipeline
  - pipeline-basic-steps
  - pipeline-model-definition
  - pipeline-stage-view
  - blueocean
  - blueocean-pipeline-editor
```

You should see Ansible output similar to the following: 

```
PLAY [all] *********************************************************************

TASK [python bootstrap] ********************************************************
changed: [default]

TASK [Gather facts] ************************************************************
ok: [default]

TASK [geerlingguy.java : Include OS-specific variables.] ***********************
ok: [default]

[...]

RUNNING HANDLER [geerlingguy.jenkins : restart jenkins] ************************
changed: [default]

PLAY RECAP *********************************************************************
default                    : ok=33   changed=4    unreachable=0    failed=0   
```
After Ansible has finished, you should be able to access Jenkins on `http://localhost:8080`. 
Use default credentials to login:
```
User: admin
Password: admin
```
All configuration can be tuned in the `playbook.yml` file. To apply new configuration run: 
```
vagrant provision
```

## Cleaning

To remove Vagrant machine that was added run:
```
vagrant destroy --force
```

## Author

* **Lukasz Bytnar** - *Vagrant-Jenkins* - [vagrant-jenkins](https://github.com/lbytnar/vagrant-jenkins)

