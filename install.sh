#!/bin/bash

# The purpose of this program is to automate the installation of packages

sudo amazon-linux-extras install epel
echo epel is installed

for package in cowsay jq tmux epel-release sl zsh git zshrc tldr gcc
do
	sudo yum install -y $package
	echo $package was installed | cowsay
done

#install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

1

source $HOME/.cargo/env

sudo apt install build-essential

cargo install bat
