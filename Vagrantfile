Vagrant.configure("2") do |config|
  config.vm.define "web01" do |web|
    web.vm.box = "ubuntu/jammy64"
    web.vm.hostname = "web01"
    web.vm.network "private_network", ip: "192.168.56.10"
    web.vm.provider "virtualbox" do |vb|
      vb.name   = "web01"
      vb.memory = "2048"
      vb.cpus   = 2
    end
  end

  config.vm.define "db01" do |db|
    db.vm.box = "ubuntu/jammy64"
    db.vm.hostname = "db01"
    db.vm.network "private_network", ip: "192.168.56.20"
    db.vm.provider "virtualbox" do |vb|
        vb.name     = "db01"
        vb.memory   = "1024"
        vb.cpus     = 1
    end
  end
end

