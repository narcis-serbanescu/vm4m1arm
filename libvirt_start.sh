#!/bin/zsh

virt-install --connect qemu:///session \
	-v \
	--virt-type qemu \
       	-n fs37libvirt \
       	-r 4098 \
	--vcpus=2 \
	--disk path=fs36libvirt.qcow2,device=disk,bus=virtio,sparse=true,size=10,cache=none \
	--cdrom=Fedora-Server-dvd-aarch64-37-1.7.iso \
	--graphics=vnc \
	--network=user \
	--os-variant=fedora37 \
	--import \
	--arch aarch64 \
	--force
