# Função para baixar e instalar um programa
function Install-Program {
    param (
        [string]$url,
        [string]$installerName,
        [string]$arguments = "/silent"
    )
    $installerPath = "$env:TEMP\$installerName"
    (New-Object System.Net.WebClient).DownloadFile($url, $installerPath)
    Start-Process -FilePath $installerPath -ArgumentList $arguments -Wait
    Remove-Item $installerPath
}
# Google Chrome
Install-Program -url "https://dl.google.com/chrome/install/375.126/chrome_installer.exe" -installerName "chrome_installer.exe"
# Google Drive
Install-Program -url "https://dl.google.com/drive-file-stream/GoogleDriveFSSetup.exe" -installerName "GoogleDriveFSSetup.exe"
# Slack
Install-Program -url "https://downloads.slack-edge.com/releases_windows/SlackSetup.exe" -installerName "SlackSetup.exe"
# Microsoft PowerBI Desktop
Install-Program -url "https://download.microsoft.com/download/1/5/8/158B2E1A-3D6A-4A4F-9D1B-8A2D1A1E1D3E/PBIDesktopSetup_x64.exe" -installerName "PBIDesktopSetup_x64.exe"
# OpenVPN
Install-Program -url "https://swupdate.openvpn.org/community/releases/OpenVPN-2.5.3-I601-amd64.msi" -installerName "OpenVPN-2.5.3-I601-amd64.msi" -arguments "/quiet"
# Amazon Redshift ODBC Driver
Install-Program -url "https://s3.amazonaws.com/redshift-downloads/drivers/odbc/1.4.32.1000/AmazonRedshiftODBC64-1.4.32.1000.msi" -installerName "AmazonRedshiftODBC64-1.4.32.1000.msi" -arguments "/quiet"
# FileZilla
Install-Program -url "https://download.filezilla-project.org/client/FileZilla_3.55.1_win64-setup.exe" -installerName "FileZilla_3.55.1_win64-setup.exe"
# psqlODBC 16
Install-Program -url "https://ftp.postgresql.org/pub/odbc/versions/msi/psqlodbc_16_00_0000-x64.zip" -installerName "psqlodbc_16_00_0000-x64.zip"
# Python
Install-Program -url "https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe" -installerName "python-3.9.7-amd64.exe" -arguments "/quiet InstallAllUsers=1 PrependPath=1"
