Vagrant.configure('2') do |config|
  public_key = File.read("#{ENV['HOME']}/.ssh/id_rsa.pub")

  provision = <<~SCRIPT
    apt install -y python
    echo "#{public_key}" >> /home/vagrant/.ssh/authorized_keys
  SCRIPT

  config.vm.define 'db' do |s|
    s.vm.box = 'ubuntu/bionic64'

    s.vm.network :forwarded_port, guest: 22, host: 2201
    s.vm.network :forwarded_port, guest: 5432, host: 5433
    s.vm.network :private_network, ip: '10.0.0.11'

    s.vm.provision :shell, inline: provision
  end

  config.vm.define 'docker' do |s|
    s.vm.box = 'ubuntu/bionic64'
    s.vm.network :forwarded_port, guest: 22, host: 2202
    s.vm.network :forwarded_port, guest: 80, host: 8080
    s.vm.network :private_network, ip: '10.0.0.12'

    s.vm.provision :shell, inline: provision
  end
end
