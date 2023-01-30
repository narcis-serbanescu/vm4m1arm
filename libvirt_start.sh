#!/bin/zsh
VMNAME=fs37libvirt2
ISOPATH=Fedora-Server-dvd-aarch64-37-1.7.iso
PASSWD='sudo_root_password'

virt-install --connect qemu:///session \
	--name ${VMNAME} \
	--description "This is ${VMNAME}" \
	-v \
	--virt-type qemu \
       	-n ${VMNAME} \
       	-r 4098 \
	--vcpus=2 \
	--accelerate \
	--disk path=${VMNAME}.qcow2,device=disk,bus=virtio,sparse=true,size=10,cache=none \
	--cdrom=Fedora-Server-dvd-aarch64-37-1.7.iso \
	--graphics=vnc \
	--network=user \
	--os-variant=fedora37 \
	--arch aarch64 \
	--force

echo "VNC connection: "
virsh vncdisplay ${VMNAME}
