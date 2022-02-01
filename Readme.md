# Qemu on Mac
This project is to run qemu on different configurations of mac starting with
bigsur x86_64

# Entitlements
In bigsur, all binaries must be code signed. brew installed qemu
is unsigned which will cause an error described here - https://bugs.launchpad.net/qemu/+bug/1818937

Use `bin/codesign.sh` to fix this issue.

# Download xenial images
Use `bin/get-cloud-images.sh` to download xenial images we will need to instanstiate a vm instance

# Create cloud-init iso image
Ubuntu cloud-images are configured using an iso - https://help.ubuntu.com/community/CloudInit

Use `bin/mk-cloud-init-iso.sh`

# Create vm directory
Create vm directory and copy xenial disk image there

```
mkdir -p vms/xenial
bin/cp-disk.sh
```

# Launch vm
```
bin/run.sh
```

# Related links
- https://arstechnica.com/civis/viewtopic.php?t=1473419
```
./qemu-system-aarch64 \
  -serial stdio \
  -M virt,highmem=off \
  -accel hvf \
  -cpu cortex-a72 \
  -smp 4 \
  -m 4096 \
  -bios /path/to/QEMU_EFI.fd
  -device virtio-gpu-pci \
  -display default,show-cursor=on \
  -device qemu-xhci \
  -device usb-kbd \
  -device usb-tablet \
  -device intel-hda \
  -device hda-duplex \
  -drive file=/path/to/Ubuntu.qcow2,if=virtio,cache=writethrough \
  -cdrom /path/to/focal-desktop-arm64.iso
  ```
