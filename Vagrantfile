Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  config.vm.provision "base-configuration", type: "shell", path: "provision.sh", env: {"DEBIAN_FRONTEND" => "noninteractive"}, privileged: true
end
