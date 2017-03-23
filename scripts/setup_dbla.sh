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
else
    echo "Blacklight already installed."
fi
