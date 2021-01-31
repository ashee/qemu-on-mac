#!/bin/sh

qemu-system-x86_64 \
    -M accel=hvf -smp 2 \
    -m 2G \
    -nic user,model=virtio \
    -drive file=$PWD/vms/xenial/disk.img,if=virtio,format=qcow2,cache=writethrough \
    -cdrom $PWD/images/cloud-init.iso \
    -initrd $PWD/images/xenial-server-cloudimg-amd64-initrd-generic \
    -kernel $PWD/images/xenial-server-cloudimg-amd64-vmlinuz-generic \
    -append "root=/dev/vda1 earlyprintk=serial console=ttyS0" \
    -nographic -serial mon:stdio

    # -initrd $PWD/vms/xenial-server-cloudimg-arm64-initrd-generic \
    # -kernel $PWD/vms/xenial-server-cloudimg-arm64-vmlinuz-generic \
    # -append "root=/dev/vda1 earlyprintk=serial console=ttyS0" \
    # -drive ./build/disk.img,if=none,id=boot,cache=writethrough \
    # -device nvme,drive=boot,serial=boot \
    # -device intel-hda \
    # -device hda-duplex \
    # -bios /Applications/ACVM.app/Contents/Resources/QEMU_EFI.fd
    # -device ramfb -device qemu-xhci \
    # -device usb-kbd \
    # -device usb-tablet \
