Vagrant.configure("2") do |config|
	config.vm.box = "hashicorp/precise64"
  	config.vm.provision :shell, path: "bootstrap.sh"
  	config.vm.network "forwarded_port", guest: 9200, host: 9200
  	config.vm.network "forwarded_port", guest: 5601, host: 5601
  	config.vm.provider "virtualbox" do |v|
  		v.memory = 1024
  	end  
end
