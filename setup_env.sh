#!/bin/bash

# Refresh repo and packages
sudo apt update && sudo apt -y upgrade

# Install general packages
sudo apt install python python-dev python-setuptools \
    python3 python3-dev python3-setuptools \
    git gdebi zsh curl pylint \
    build-essential cmake nodejs npm

# Install npm dependencies
sudo npm install -g typescript tern

# Get pip
sudo easy_install pip
sudo easy_install3 pip

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Get diff highlighter
mkdir -p ~/bin
cd ~/bin
wget https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight && chmod +x diff-highlight
cd

# Install nvim
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# Setup python compatibility
sudo apt-get install python-dev python-pip python3-dev python3-pip
pip2 install --user neovim
pip3 install --user neovim

# Link to config files
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

