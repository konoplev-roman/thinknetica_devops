Vagrant.configure('2') do |config|
  (1..2).each do |i|
    config.vm.define "server#{i}" do |server|
      server.vm.box = 'hashicorp/precise64'
      server.vm.hostname = "server#{i}"
      server.vm.network 'private_network', ip: "10.0.0.#{i + 1}"
    end
  end
end
