#!/bin/bash

# Used for internal CI
# Probably not much value for others, but YMMV :)

set -eux

# Remove existing artefacts
rm -rf packer_cache output-qemu builds

packer build -var="vm_name=windows_server_2016" -var "autounattend=./answer_files/2016/Autounattend.xml" -var="iso_checksum=772700802951b36c8cb26a61c040b9a8dc3816a3" -var="iso_url=/opt/iso/Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"  packer.json
# Push to S3
mc cp output-qemu/packer-qemu  s3/pentesterwtf/qemu/windows-server-2016.qcow2
