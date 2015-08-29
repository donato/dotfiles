#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform   
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    get=brew
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
    get=apt-get
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    echo "Uncharted territory!"
fi

## Sanity check
sudo $get install git

## Set up dotfiles repo
git clone git://github.com/donato/dotfiles.git "$HOME/git/dotfiles"
cd $HOME/git/dotfiles
git pull --rebase
git submodule update --init --recursive

## Setup ansible
git clone git://github.com/ansible/ansible.git "$HOME/git/ansible"
sudo $get install python-pip
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

