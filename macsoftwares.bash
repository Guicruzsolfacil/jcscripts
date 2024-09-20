#!/bin/bash

# Baixar e instalar OpenVPN
curl -L -o openvpn.dmg https://swupdate.openvpn.org/community/releases/OpenVPN-2.5.3-I601-amd64.dmg
hdiutil attach openvpn.dmg
sudo cp -R /Volumes/OpenVPN/OpenVPN.app /Applications/
hdiutil detach /Volumes/OpenVPN
rm openvpn.dmg

# Baixar e instalar Visual Studio Code
curl -L -o vscode.zip https://update.code.visualstudio.com/latest/darwin/stable
unzip vscode.zip -d /Applications/
rm vscode.zip

echo "Instalação concluída!"
