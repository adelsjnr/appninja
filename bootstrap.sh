#!/bin/bash

# Install some basic packages
apt-get update
apt-get install -y vim curl git

# Install ruby version 2.1.1 with rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install 2.2.2

# Install chef-solo
curl -L https://www.opscode.com/chef/install.sh | bash
chef-solo -v

