# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "trusty"
  #config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Create a private network
  #config.vm.network :private_network, ip: "10.0.4.2"

  # Create a public network
  config.vm.network :public_network, bridge: 'wlan0'

  config.vm.provision "shell", path: "provision.sh", privileged: false
end
