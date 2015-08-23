#!/bin/sh

## Sanity check
sudo apt-get install git

## Set up dotfiles repo
git clone git://github.com/donato/dotfiles.git "$HOME/git/dotfiles"
cd $HOME/git/dotfiles
git pull --rebase
git submodule update --init --recursive

## Setup ansible
git clone git://github.com/ansible/ansible.git "$HOME/git/ansible"
sudo apt-get install python-pip
sudo pip install paramiko PyYAML Jinja2 httplib2 six
cd $HOME/git/ansible/
git pull --rebase
git submodule update --init --recursive
source hacking/env-setup



# Now run ansible init script locally
### Setup local host connection
mkdir -p "$HOME/ansible"
echo "127.0.0.1 ansible_connection=local" > "$HOME/ansible/inventory"
export ANSIBLE_INVENTORY=$HOME/ansible/inventory

### Run it
cd $HOME/git/dotfiles
ansible-playbook tasks/setup-local-dev

