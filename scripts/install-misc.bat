REM Install whatever you need here
REM choco should work here

msiexec /qb /i "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-qemu-ga/qemu-ga-win-100.0.0.0-3.el7ev/qemu-ga-x64.msi"

REM Copy our sysprep Autounattend for our post-packer first boot
copy "A:/Firstboot-Autounattend.xml" "C:/Windows/Temp/Autounattend.xml"
