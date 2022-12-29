#!/bin/zsh
# qemu-img create -f qcow2 diskf36x86_64.qcow2 10G
VMNAME=rh87x86_64
PASSWD='sudo_passwd'

echo ${PASSWD} | sudo -S qemu-system-x86_64 \
  -cpu qemu64 \
  -accel tcg,thread=multi \
  -M q35 \
  -smp 4 \
  -serial stdio \
  -name ${VMNAME} \
  -m 8192 \
  -vga std \
  -usb \
  -drive file=/opt/homebrew/Cellar/qemu/7.2.0/share/qemu/edk2-x86_64-secure-code.fd,if=pflash,format=raw,readonly=on \
  -device qemu-xhci \
  -device VGA,vgamem_mb=64 \
  -device usb-kbd \
  -device usb-tablet \
  -device virtio-gpu-pci \
  -display default,show-cursor=on \
  -device intel-hda \
  -device hda-duplex \
  -device virtio-balloon \
  -device virtio-scsi-pci,id=scsi0 \
  -drive file=disk_${VMNAME}.qcow2,if=none,format=qcow2,discard=unmap,cache=none,id=hd0 \
  -device scsi-hd,drive=hd0,bus=scsi0.0 \
  -net nic,model=virtio,macaddr=54:54:00:52:52:52 \
  -net user,hostfwd=tcp::2322-:22,hostfwd=tcp::8008-:80,hostfwd=tcp::443-:443, \
  -netdev vmnet-shared,id=net0 \
  -device virtio-net,netdev=net0,mac=54:54:00:42:42:42 \
  -boot c
  
  # -boot d
  # -cdrom RHEL-8.7.0-20221013.1-x86_64-dvd1.iso
  
