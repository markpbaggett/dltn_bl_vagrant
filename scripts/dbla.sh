#!/bin/bash

echo "Checking for DBLA"
cd /home/vagrant || exit
if [ ! -d /home/vagrant/dbla ]; then
  echo "Cloning DBLA"
  git clone https://github.com/barmintor/dbla
else
  cd dbla || exit
  echo "Updating DBLA"
  git pull origin master
fi
