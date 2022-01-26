#!/bin/bash

# Used for internal CI
# Probably not much value for others, but YMMV :)

set -eux

# Remove existing artefacts
rm -rf packer_cache output-qemu builds

packer build -var="vm_name=windows_10" -var="iso_checksum=8a38844da7bdbe77de7d8227ac5962fff357abcc" -var="iso_url=/opt/iso/19042.631.201119-0144.20h2_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso" packer.json

# Push to S3
mc cp output-qemu/packer-qemu s3/pentesterwtf/qemu/windows-10-1904.qcow
