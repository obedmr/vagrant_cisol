# -*- mode: ruby -*-
# vi: set ft=ruby :
 
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.box = "ubuntu/trusty64"
 
  # DB Server
  config.vm.define "dbserver" do |db_config|
    db_config.vm.hostname = "dbserver"
    #db_config.vm.provision "shell", path: "scripts/db_server.sh" 
    db_config.vm.network "private_network", ip: "10.0.0.11"
  end
  # End DB Server

 # Web Server
  config.vm.define "webserver" do |web_config|
    web_config.vm.hostname = "webserver"
    #web_config.vm.provision "shell", path: "scripts/web_server.sh"
    web_config.vm.network "private_network", ip: "10.0.0.12"
    web_config.vm.network "forwarded_port", guest: 80, host: 8080
  end
  # End Web Server
end
