# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "vm1" do |vm1|
    vm1.vm.provider "docker" do |docker|
      docker.build_dir = "."
      docker.has_ssh  = true
      docker.name = "vm1"
      docker.ports = ["8080:80"]
    end
    vm1.ssh.insert_key = false
    vm1.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
    vm1.ssh.username = "vagrant"
    vm1.vm.synced_folder ".", "/vagrant", disabled: true  
    vm1.vm.hostname = "vm1"
    vm1.vm.network "private_network", ip: "10.100.102.7"
  end

  config.vm.define "vm2" do |vm2|
    vm2.vm.provider "docker" do |docker|
      docker.build_dir = "."
      docker.has_ssh  = true
      docker.name = "vm2"
      docker.ports = ["8081:80"]
    end
    vm2.ssh.insert_key = false
    vm2.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
    vm2.ssh.username = "vagrant"
    vm2.vm.synced_folder ".", "/vagrant", disabled: true  
    vm2.vm.hostname = "vm2"
    vm2.vm.network "private_network", ip: "10.100.102.8"
  end
end