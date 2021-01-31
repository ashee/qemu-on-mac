#!/bin/sh

FILES=( \
https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img \
https://cloud-images.ubuntu.com/xenial/current/unpacked/xenial-server-cloudimg-amd64-initrd-generic \
https://cloud-images.ubuntu.com/xenial/current/unpacked/xenial-server-cloudimg-amd64-vmlinuz-generic \
)

mkdir -p images

for f in "${FILES[@]}" ; do
    (cd images && wget -b "$f")
done
