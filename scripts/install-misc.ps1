# Installs the code signing cert for RedHat
# which is needed to trust the driver installation for QEMU related hardware

# Install redhat cert for trust
certutil -addstore -f "TrustedPublisher" a:/redhat-cert.cer

# Install chocolatey
cmd /c C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"

# Due to PATH, choco probably won't work here...
