VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box       = 'ubuntu/trusty64'
  config.vm.box_url   = 'https://vagrantcloud.com/ubuntu/trusty64'
  config.vm.host_name = 'huntthemdown-dev'
  config.vm.synced_folder '.', '/huntthemdown'

  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  config.vm.provision "shell", privileged: false, path: "config/vagrant/setup.sh"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 4
  end
end