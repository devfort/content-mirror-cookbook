# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "cpan-mirror-berkshelf"
  config.vm.box = "ubuntu-13.04"
  # TODO: Find a suitable basebox for Vagrant (we need dozens of gigs!)
  # TODO: VM box URL
  # config.vm.box_url = ""

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :minitest => { ci_reports: "report.xml" },
      'cpan_mirror' => {
        'data_dir' => '/home/vagrant/cpan',
        'user' => 'vagrant'
      }
    }

    chef.run_list = [
      "recipe[minitest-handler]",
      "recipe[cpan-mirror::default]",
    ]
  end
end
