# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Specify the Docker provider
  config.vm.provider "docker" do |docker|
    docker.build_dir = "."

    docker.has_ssh  = true

    # Optional: Define a custom name for the container
    docker.name = "my-vagrant-container"
  end

  config.ssh.insert_key = false
  config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
  config.ssh.username = "vagrant"
  config.vm.synced_folder ".", "/vagrant", disabled: true
end