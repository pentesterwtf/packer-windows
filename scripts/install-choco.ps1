# Installs the code signing cert for RedHat
# which is needed to trust the driver installation for QEMU related hardware

# Install redhat cert for trust
certutil -addstore -f "TrustedPublisher" a:/redhat-cert.cer

# Install chocolatey
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

# Due to PATH, choco probably won't work here...
# Also install openssh here
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0"


# Enable SSH
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Start-Service sshd"
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Set-Service -Name sshd -StartupType 'Automatic'"
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-NetFirewallRule -Name *ssh*"
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22"
