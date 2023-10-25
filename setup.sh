#!/bin/bash

apps="vim \
	git \
	tmux \
	curl \
	wget \
	nmap 
"

sudo apt update -y 
sudo apt upgrade -y
sudo apt install -y ${apps}

ln -s ~/repos/.dotfiles/.bashrc ~/.bashrc
ln -s ~/repos/.dotfiles/.profile ~/.profile
ln -s ~/repos/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/repos/.dotfiles/.tmux.conf ~/.tmux.conf

# TMUX Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# VIM Plugin Manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
