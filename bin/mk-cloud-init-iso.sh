#!/bin/sh

[[ -f images/cloud-init.iso ]] && rm images/cloud-init.iso
hdiutil makehybrid -o images/cloud-init.iso -hfs -joliet -iso -default-volume-name cidata cloud-init