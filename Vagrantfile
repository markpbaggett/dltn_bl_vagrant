# Vagrant for DLTN Hackfest Meeting - March 2017

Vagrant.configure(2) do |config|
  unless  $forward.eql? "FALSE"
      config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true # Tomcat
      config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true # MySQL
      config.vm.network :forwarded_port, guest: 8000, host: 8000 # Apache
      config.vm.network :forwarded_port, guest: 3000, host: 3000
      config.vm.network :forwarded_port, guest: 8983, host: 8983
  end

  config.vm.box_download_insecure = "jadesystems/rails5"
  config.vm.box = "jadesystems/rails5"

  shared_dir = "/vagrant"
  config.vm.provision :shell, path: "./scripts/dbla.sh", :args => shared_dir, :privileged => false
end