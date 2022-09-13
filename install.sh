#!/bin/bash
#The purpose of this program is to automate the installation of packages
for packakage in cowsay jq tmux amazon-linux-extras epel-release sl
do
    sudo yum install -y on $packages
    echo $package was installed | cowsay
done
