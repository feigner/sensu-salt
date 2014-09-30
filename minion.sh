#!/bin/bash

echo 'Bootstrapping salt minion'

echo 'Adding salt ppa / installing'
sudo apt-get update
sudo apt-get --yes install python-software-properties
sudo add-apt-repository ppa:saltstack/salt
sudo apt-get update
sudo apt-get --yes install salt-minion

echo "Setting salt master: ${1}"
sudo sed 's/#master: salt/master: '${1}'/g' /srv/salt/minion | sudo tee /etc/salt/minion > /dev/null

echo 'Starting Salt Minion'
sudo service salt-minion restart

echo 'Calling highstate [10]'
sudo salt-call state.highstate
echo 'Done!'
