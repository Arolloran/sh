#!/bin/bash

InstallDocker () {
  sudo apt remove -y docker docker.io
  sudo apt update -y
  sudo apt install -y apt-transport-https ca-certificates wget software-properties-common curl gnupg-agent
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt update -y
  sudo apt install -y docker-ce docker-ce-cli containerd.io

  # (опційно) створення групи docker і додання в неї поточного користувача
  sudo groupadd docker
  sudo usermod -aG docker $USER

  # (опційно) запуск демона Docker і включення в автозавантаження
  sudo systemctl start docker
  sudo systemctl enable docker
}


InstallDockerCompose () {
  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
}


InstallDocker
InstallDockerCompose
# InstallOther
