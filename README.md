# Windows / KVM packer templates

Builds Win10 (latest) and Server 2019 (Latest)

This will sysprep on first boot after packaging. This can be changed by modifying the shutdown command back to the following:

```
"shutdown_command": "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Shutdown\""
```

## Prereqs

* KVM/Libvirt
* Packer

## Building

### Windows 10 (1904)

`packer build windows.json`

### Server 2019

`packer build -var="name=windows_server_2019" -var "autounattend=./answer_files/2019/Autounattend.xml" -var="iso_checksum=645477fc661703f537a112cf1a84ea655e281082" -var="iso_url=https://software-download.microsoft.com/download/sg/17763.253.190108-0006.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso" windows.json`
