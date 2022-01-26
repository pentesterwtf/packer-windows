#!/bin/bash

# Used for internal CI
# Probably not much value for others, but YMMV :)

set -eux

# Remove existing artefacts
rm -rf packer_cache output-qemu builds

packer build -var="vm_name=windows_server_2019" -var "autounattend=./answer_files/2019/Autounattend.xml" -var="iso_checksum=91e3a2f1acc39af21353c7cc105c799494d7539f" -var="iso_url=/opt/iso/17763.253.190108-0006.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso"  packer.json

# Push to S3
mc cp output-qemu/packer-qemu s3/pentesterwtf/qemu/windows-server-2019-17763.qcow2
