#!/bin/bash
#The purpose of this program is to automate the installation of packages
for packakage in cowsay jq tmux amazon-linux-extras epel-release sl
do
	sudo yum install -y $package
 	echo $package was installed | cowsay
done

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
