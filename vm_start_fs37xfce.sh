#!/bin/zsh
QEMU_VER=7.2.0
VMNAME=fs37xfce
PASSWD='sudo_passwd'

echo ${PASSWD} | sudo -S qemu-system-aarch64 \
    -M virt,highmem=on \
    -object rng-random,id=rng0,filename=/dev/urandom \
    -accel hvf \
    -name ${VMNAME} \
    -cpu host \
    -smp 4 \
    -m 4096 \
    -serial telnet::4444,server,nowait \
    -drive file=/opt/homebrew/Cellar/qemu/${QEMU_VER}/share/qemu/edk2-aarch64-code.fd,if=pflash,format=raw,readonly=on \
    -device virtio-rng-pci,rng=rng0 \
    -device virtio-balloon \
    -device virtio-scsi-pci,id=scsi0 \
    -drive file=disk${VMNAME}.qcow2,if=none,format=qcow2,discard=unmap,cache=none,id=hd0 \
    -device scsi-hd,drive=hd0,bus=scsi0.0 \
    -device ramfb \
    -device virtio-gpu-pci \
    -display default,show-cursor=on \
    -device qemu-xhci \
    -device usb-ehci \
    -device usb-kbd \
    -device usb-tablet \
    -usb \
    -net nic,model=virtio,macaddr=54:54:00:55:49:49 \
    -net user,hostfwd=tcp::2722-:22,hostfwd=tcp::5900-:5900 \
    -netdev vmnet-shared,id=net0 \
    -device virtio-net-device,netdev=net0,mac=54:54:00:45:44:49 \
    -monitor stdio \
    -fsdev local,id=tmp,path=/tmp,security_model=none \
    -device virtio-9p-pci,fsdev=tmp,mount_tag=tmp

    # -display vnc=127.0.0.1:0 \
    # -device virtio-gpu-pci \
    #
    # -cdrom RHEL-9.0.0-20220420.0-aarch64-dvd1.iso
    
