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