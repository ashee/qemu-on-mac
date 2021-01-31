#!/bin/sh

# see - https://stackoverflow.com/questions/64642062/apple-hypervisor-is-completely-broken-on-macos-big-sur-beta-11-0-1
codesign -s - --entitlements bin/qemu.entitlements --force $(which qemu-system-x86_64)
