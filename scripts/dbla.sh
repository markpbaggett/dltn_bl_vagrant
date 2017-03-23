#!/bin/bash

echo "Checking for DBLA"
cd /home/vagrant || exit
if [ ! -d /home/vagrant/dbla ]; then
  echo "Cloning DBLA"
  git clone https://github.com/barmintor/dbla
  cd dbla
  echo "Override old DBLA config"
  curl -L https://gist.githubusercontent.com/markpbaggett/1d4883578a94a85292a185f150073695/raw/e722a6900f1a2d76c10b48818a60c5d35e81a4d4/dbla.gemspec > dbla.gemspec
else
  cd dbla || exit
  echo "Updating DBLA"
  git pull origin master
fi
