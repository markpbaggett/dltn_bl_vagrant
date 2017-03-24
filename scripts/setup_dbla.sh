#!/bin/bash

echo "Check Blacklight Install"
cd /home/vagrant || exit
if [ ! -d /home/vagrant/search_app ]; then
    echo "Installing Blacklight"
    rails new search_app -m https://raw.github.com/projectblacklight/blacklight/master/template.demo.rb
    cd search_app || exit
    echo "Adding dbla to Gemfile"
    printf '\ngem "dbla", github: "barmintor/dbla", :branch => "master"' >> Gemfile
    echo "Bundle install"
    bundle config local.dbla /home/vagrant/dbla/
    bundle install
    echo "Run DBLA Generators"
    rails g dbla:install
    echo "Copying DPLA Credentials"
    cp /vagrant/config/dpla.yml config/
    echo "Configure catalog controller"
    cd /home/vagrant/search_app/app/controllers/
    curl -L https://gist.githubusercontent.com/markpbaggett/4e769d80491e272e84d209a8e2c97b16/raw/2c5824f7098dbb907f88deb03b30a20c6d8ac9ff/catalog_controller.rb > catalog_controller.rb
    rails s
else
    echo "Blacklight already installed."
fi
