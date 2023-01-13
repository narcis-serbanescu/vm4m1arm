#!/bin/zsh
# https://gist.github.com/citruz/9896cd6fb63288ac95f81716756cb9aa
# https://wiki.gentoo.org/wiki/QEMU/Windows_guest
# qemu-img create -f qcow2 diskf36x86_64.qcow2 10G
VMNAME=w7x86_64
PASSWD=sudo_passwd
echo ${PASSWD} | sudo -S qemu-system-x86_64 \
  -cpu qemu64 \
  -accel tcg,thread=multi \
  -M q35 \
  -smp 4 \
  -monitor stdio \
  -name ${VMNAME} \
  -m 8192 \
  -device VGA,vgamem_mb=64 \
  -device virtio-rng-pci \
  -device virtio-balloon \
  -drive file=disk_${VMNAME}.qcow2,if=virtio,format=qcow2 \
  -net nic,model=rtl8139,macaddr=54:54:00:57:52:52 \
  -net user,hostname=${HOSTNAME},hostfwd=tcp::2722-:22 \
  -drive file=virtio-win-0.1.229.iso,media=cdrom \
  -boot c
  
