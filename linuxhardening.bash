#!/bin/bash

# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Instalar pacotes essenciais
sudo apt install -y ufw fail2ban auditd

# Configurar o UFW (Uncomplicated Firewall)
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# Configurar Fail2Ban bruteforce
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Configurar auditoria com auditd
sudo systemctl enable auditd
sudo systemctl start auditd

# Desabilitar serviços desnecessários
sudo systemctl disable avahi-daemon
sudo systemctl disable cups

# Configurar parâmetros de segurança no sysctl
cat <<EOF | sudo tee /etc/sysctl.d/99-hardening.conf
# IP Spoofing protection
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Ignore ICMP broadcast requests
net.ipv4.icmp_echo_ignore_broadcasts = 1

# Disable source packet routing
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv6.conf.default.accept_source_route = 0

# Ignore send redirects
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# Block SYN attacks
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_max_syn_backlog = 2048
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_syn_retries = 5
EOF

sudo sysctl -p /etc/sysctl.d/99-hardening.conf

# Configurar permissões de arquivos e diretórios
sudo chmod 700 /root
sudo chmod 600 /boot/grub/grub.cfg

# Configurar SSH
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "Hardening concluído com sucesso!"
