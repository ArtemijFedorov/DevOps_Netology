Это ссылка на форк. Проблема с падением виртуалки осталась.
https://github.com/ArtemijFedorov/shvirtd-example-python.git

Дальше файл со скриптом

#!bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc


echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

cd /opt

sudo git clone https://github.com/ArtemijFedorov/shvirtd-example-python.git

cd shvirtd-example-python

docker build -f Dockerfile.python -t python_cont .

docker compose up -d