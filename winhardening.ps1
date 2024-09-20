# Desabilita o Remote Desktop
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 1
# Desabilitar o serviço de Área de Trabalho Remota
Set-Service -Name TermService -StartupType Disabled
Stop-Service -Name TermService
# Habilitar o Firewall do Windows
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
# Habilitar a Proteção de Rede
Set-MpPreference -EnableNetworkProtection Enabled
# Habilitar a integridade da memória
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" -Name "Enabled" -Value 1
# Habilitar BitLocker
Enable-BitLocker -MountPoint "C:" -EncryptionMethod XtsAes256 -UsedSpaceOnly
# Desabilitar o protocolo SMBv1
Set-SmbServerConfiguration -EnableSMB1Protocol $false
# Habilitar a Proteção contra Exploits
Set-ProcessMitigation -System -Enable DEP, SEHOP, ASLR
# Fechar portas de rede não utilizadas
Disable-NetAdapterBinding -Name "Ethernet" -ComponentID ms_server
Disable-NetAdapterBinding -Name "Ethernet" -ComponentID ms_pacer
# Aumentar o nível de controle de conta de usuário
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 2