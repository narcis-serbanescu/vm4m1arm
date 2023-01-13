#!/bin/zsh
# https://gist.github.com/citruz/9896cd6fb63288ac95f81716756cb9aa
# https://wiki.gentoo.org/wiki/QEMU/Windows_guest
# qemu-img create -f qcow2 disk_w81x86_64.qcow2 10G
VMNAME=w81x86_64
PASSWD=sudo_passwd
echo ${PASSWD} | sudo -S qemu-system-x86_64 \
  -cpu qemu64 \
  -accel tcg,thread=multi \
  -M q35 \
  -smp 4 \
  -name ${VMNAME} \
  -monitor stdio \
  -m 8192 \
  -device VGA,vgamem_mb=64 \
  -device virtio-gpu-pci \
  -device virtio-balloon \
  -device virtio-rng-pci \
  -drive file=disk_${VMNAME}.qcow2,if=virtio,format=qcow2 \
  -net nic,model=rtl8139,macaddr=54:54:00:58:52:52 \
  -net user,hostname=${VMNAME},hostfwd=tcp::2822-:22 \
  -netdev vmnet-shared,id=net0 \
  -device virtio-net,netdev=net0,mac=54:54:00:48:42:42 \
  -boot c \
  -drive file=Windows_8.1_Pro_X64_Activated.iso,media=cdrom \
  -drive file=virtio-win-0.1.229.iso,media=cdrom
  
