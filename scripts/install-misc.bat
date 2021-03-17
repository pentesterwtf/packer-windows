REM Install whatever you need here
REM choco should work here

msiexec /qb /i "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-qemu-ga/qemu-ga-win-100.0.0.0-3.el7ev/qemu-ga-x64.msi"

REM Install spice-agent
choco install spice-agent -y

REM Copy our sysprep Autounattend for our post-packer first boot
copy "A:/Firstboot-Autounattend.xml" "C:/Windows/Temp/Autounattend.xml"
REM Copy the enable-winrm script, relied on by our post-packer autounattend script
copy "A:/enable-winrm.ps1" "C:/Windows/Temp/enable-winrm.ps1"

REM Set high performance mode
powercfg /SETACTIVE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c