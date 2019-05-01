Vagrant.configure('2') do |config|
  (1..2).each do |i|
    config.vm.define "server#{i}" do |server|
      server.vm.box = 'hashicorp/precise64'
      server.vm.hostname = "server#{i}"
      server.vm.network 'private_network', ip: "10.0.0.#{i + 1}"
    end
  end

  config.vm.define 'clean_ubuntu' do |machine|
    machine.vm.box = 'ubuntu/bionic64'

    script = <<~SCRIPT
      # Install Docker
      curl -fsSL https://get.docker.com | sh
      usermod -aG docker vagrant

      # Install Docker Compose
      curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
      chmod +x /usr/local/bin/docker-compose
      ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    SCRIPT

    machine.vm.network 'forwarded_port', guest: 80, host: 8080

    machine.vm.provision :shell, inline: script
  end
end
