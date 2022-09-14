#!/bin/bash

# The purpose of this program is to automate the installation of packages

sudo amazon-linux-extras install epel
echo epel is installed

for package in cowsay jq tmux epel-release sl zsh git tldr gcc shellcheck
do
	sudo yum install -y $package
	echo $package was installed | cowsay
done

# Install shellcheck
sudo apt install shellcheck

# Install tldr
sudo pip3 install tldr

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -y | sh -s -- -y
echo rust was installed | cowsay

source $HOME/.cargo/env

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo ohmyzsh was installed | cowsay

# Get the .zshrc file
curl https://raw.githubusercontent.com/kris-classes/restart/main/tia_zshrc > $HOME/.zshrc
echo retrieved .zshrc | cowsay

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo zsh-autosuggestions was installed | cowsay

# Install tmux
git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make
sudo make install

# Install ohmytmux
cd $HOME
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Change shell into zsh
sudo chsh -s $(which zsh) $(whoami)
zsh
