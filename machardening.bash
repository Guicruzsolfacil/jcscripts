#!/bin/bash
# Habilitar firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Habilitar modo furtivo do firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on


# Desabilitar serviços de rede desnecessários
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.ftp.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.tftpd.plist
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.telnetd.plist

# Configurar atualizações automáticas
sudo softwareupdate --schedule on

# Configurar senha de firmware
sudo firmwarepasswd -setpasswd

# Desabilitar Bluetooth se não for necessário
sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0
sudo killall -HUP blued

# Desabilitar o carregamento automático de mídias removíveis
defaults write /Library/Preferences/SystemConfiguration/autodiskmount AutomountDisksWithoutUserLogin -bool false

# Configurar permissões de arquivos e diretórios
sudo chmod -R o-rwx /Library
sudo chmod -R o-rwx /System
sudo chmod -R o-rwx /usr

# Desabilitar o root
dsenableroot -d
