#!/bin/bash

# The purpose of this program is to automate the installation of packages

sudo amazon-linux-extras install epel
echo epel is installed

for package in cowsay jq tmux epel-release sl zsh git tldr gcc shellcheck
do
	sudo yum install -y $package
	echo $package was installed | cowsay
done

#install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl https://raw.githubusercontent.com/kris-classes/restart/main/tia_zshrc > $HOME/.zshrc
echo retrieved .zshrc | cowsay

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custo$
echo zsh-autosuggestions was installed | cowsay

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -y | sh -s -- -y
echo rust was installed | cowsay

source $HOME/.cargo/env

# sudo apt install build-essential

cargo install bat
echo cargo install bat is completed | cowsay
