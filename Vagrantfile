# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.provider "docker" do |docker|
      docker.build_dir = "."
      docker.build_args = ['--file', 'Dockerfile.ubuntu']
      docker.has_ssh  = true
      docker.name = "ubuntu"
      docker.ports = ["8080:80"]
    end
    ubuntu.ssh.insert_key = false
    ubuntu.ssh.private_key_path = "~/.ssh/id_rsa"
    ubuntu.ssh.username = "vagrant"
    ubuntu.vm.synced_folder ".", "/vagrant", disabled: true  
    ubuntu.vm.hostname = "ubuntu"
    ubuntu.vm.network "private_network", ip: "10.100.102.7"
  end

  config.vm.define "centos" do |centos|
    centos.vm.provider "docker" do |docker|
      docker.build_dir = "."
      docker.build_args = ['--file', 'Dockerfile.centos']
      docker.has_ssh  = true
      docker.name = "centos"
      docker.ports = ["8081:80"]
    end
    centos.ssh.insert_key = false
    centos.ssh.private_key_path = "~/.ssh/id_rsa"
    centos.ssh.username = "vagrant"
    centos.vm.synced_folder ".", "/vagrant", disabled: true  
    centos.vm.hostname = "centos"
    centos.vm.network "private_network", ip: "10.100.102.8"
  end
end