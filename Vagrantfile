VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box       = 'ubuntu/trusty64'
  config.vm.box_url   = 'https://vagrantcloud.com/ubuntu/trusty64'
  config.vm.host_name = 'huntthemdown-dev'
  config.vm.synced_folder '.', '/huntthemdown'

  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'config/puppet/manifests'
    puppet.manifest_file = 'development.pp'
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end
end