#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform   
    if [ ! -f /usr/local/bin/brew ]
        then
	    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    get="brew"
    $get install python
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under Linux platform
    get="sudo apt-get"
    $get install python-pip
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
    echo "Uncharted territory!"
fi

## Sanity check
$get install git

## Set up dotfiles repo
git clone git://github.com/donato/dotfiles.git "$HOME/git/dotfiles"
cd $HOME/git/dotfiles
git pull --rebase
git submodule update --init --recursive

## Setup ansible
git clone git://github.com/ansible/ansible.git "$HOME/git/ansible"
pip install paramiko PyYAML Jinja2 httplib2 six
cd $HOME/git/ansible/
git pull --rebase
git submodule update --init --recursive
source hacking/env-setup



# Now run ansible init script locally
echo "Running ansible"
### Setup local host connection
mkdir -p "$HOME/ansible"
echo "127.0.0.1 ansible_connection=local" > "$HOME/ansible/inventory"
export ANSIBLE_INVENTORY=$HOME/ansible/inventory

### Run it
cd $HOME/git/dotfiles
ansible-playbook tasks/setup-local-dev --ask-become-pass


