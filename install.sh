#!/bin/bash
sudo wget https://github.com/moparisthebest/static-curl/releases/download/v7.78.0/curl-amd64 -O /usr/bin/curl
sudo chmod +x /usr/bin/curl
sudo curl -fsSL https://get.docker.com/ | sudo sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo systemctl disable apache2
sudo usermod -aG docker $USER
sudo reboot
