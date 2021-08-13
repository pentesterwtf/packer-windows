# Installs the code signing cert for RedHat
# which is needed to trust the driver installation for QEMU related hardware

# Install redhat cert for trust
certutil -addstore -f "TrustedPublisher" a:/redhat-cert.cer
# Install the old redhat cert, used for most of their kvm drivers
certutil -addstore -f "TrustedPublisher" a:/redhat-cert-old.cer

# Install chocolatey
# Now with TLS workarounds for Server 2016 - https://docs.chocolatey.org/en-us/choco/setup and https://github.com/TheJumpCloud/support/issues/221
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"

# Due to PATH, choco probably won't work here...
# Also install openssh here
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0"


# Enable SSH
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Start-Service sshd"
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Set-Service -Name sshd -StartupType 'Automatic'"
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "Get-NetFirewallRule -Name *ssh*"
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22"
