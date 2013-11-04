# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "cpan-mirror-berkshelf"
  config.vm.box = "devfort-ubuntu-13.04-provisionerless-120gb"
  config.vm.box_url = "http://devfort.s3.amazonaws.com/boxes/devfort-ubuntu-13.04-provisionerless-120gb-virtualbox.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      'apache' => {
        'default_site_enabled' => false
      },
      'cpan_mirror' => {
        'data_dir' => '/home/vagrant/cpan',
        'user' => 'vagrant'
      }
    }

    chef.run_list = [
      "recipe[cpan-mirror::default]",
    ]
  end
end
