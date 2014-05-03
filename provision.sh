#!/bin/bash

set -e

# Disable v6, fails for me otherwise
echo net.ipv6.conf.all.disable_ipv6=1 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

# Install required software
sudo apt-get update -y
sudo apt-get install -y golang git nginx unzip tmux

# Install gogs as needed, bind to localhost
cd ~
rm -rf gogs
rm -f *.zip
wget http://gogs.qiniudn.com/gogs_v0.3.1_linux_amd64.zip
unzip gogs_v0.3.1_linux_amd64.zip
cd gogs
mkdir -p custom/conf
cp conf/app.ini custom/conf/
sed -i 's/^HTTP_ADDR = /HTTP_ADDR = 127.0.0.1/' custom/conf/app.ini

# Add nginx as a proxy in front of gogs
sudo cp /vagrant/default.nginx.conf /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

# What's left: start gogs manually
echo "All done. Please start gogs manually with: ~/gogs/start.sh"
