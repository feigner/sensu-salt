# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"


  config.vm.define "server-dev" do |minion_config|
    minion_config.vm.host_name = 'sensu-server-dev'

    minion_config.vm.synced_folder ".", "/srv/salt"
    minion_config.vm.network :private_network, ip: "10.12.13.20"
    minion_config.vm.network :forwarded_port, host:9968, guest: 3000

    minion_config.vm.provision :shell do |shell|
      shell.path = "minion.sh"
      shell.args = "localhost"
    end

  end

  config.vm.define "client-dev" do |minion_config|
    minion_config.vm.host_name = 'sensu-client-dev'

    minion_config.vm.synced_folder ".", "/srv/salt"
    minion_config.vm.network :private_network, ip: "10.12.13.19"

    minion_config.vm.provision :shell do |shell|
      shell.path = "minion.sh"
      shell.args = "localhost"
    end

  end

  # Virtualbox-specific settings
  #
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

end
