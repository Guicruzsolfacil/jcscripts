#!/bin/bash

#Instalação de softwares via download direto: Para alguns softwares como Teleport, Sublime Text, DBeaver, pgAdmin, 
#Visual Studio Code e AWS CLI, o script baixa os instaladores diretamente dos sites oficiais e os instala.

# Atualizar a lista de pacotes
sudo apt update

# Instalar Zsh
sudo apt install -y zsh

# Instalar Terminator
sudo apt install -y terminator

# Instalar Unzip
sudo apt install -y unzip

# Instalar Teleport
curl https://get.gravitational.com/teleport-v8.0.7-linux-amd64-bin.tar.gz -o teleport.tar.gz
tar -xzf teleport.tar.gz
sudo mv teleport/tctl teleport/tsh teleport/teleport /usr/local/bin/
rm -rf teleport teleport.tar.gz

# Instalar Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt update
sudo apt install -y sublime-text

# Instalar Python3 e pip
sudo apt install -y python3 python3-pip

# Instalar OpenVPN
sudo apt install -y openvpn

#Instalação de Docker e Docker Compose: Inclui a adição de repositórios e chaves GPG necessárias.
# Instalar Docker
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Instalar DBeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update
sudo apt install -y dbeaver-ce

# Instalar pgAdmin
curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add -
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install -y pgadmin4

# Instalar Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

# Instalar AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws

# Instalar Flameshot
sudo apt install -y flameshot

echo "Instalação concluída!"
