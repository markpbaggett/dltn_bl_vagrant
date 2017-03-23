#!/bin/bash

echo "Check Blacklight Install"
cd /home/vagrant || exit
if [ ! -d /home/vagrant/search_app ]; then
    echo "Installing Blacklight"
    rails new search_app -m https://raw.github.com/projectblacklight/blacklight/master/template.demo.rb
    cd search_app || exit
    echo 'gem "dbla"' >> Gemfile
else
    echo "Blacklight already installed."
fi
