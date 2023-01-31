# QEMU based Virtual Machines with GUI and Network running on MAC computers with Apple Silicon (M1 devices)         

## How to setup and run Linux and Windows VMs on Apple M1 host using QEMU, libvirt and HVF with GUI and network        

### Requirements

HOST
- MacOS - 12.6.1 Monterey
- Chip - M1 Pro
- QEMU - 7.2.0  
- libvirt - 8.9.0  
- virt-manager - 4.1.0  

Guest OS Fedora Linux, RHEL8 x86_64, Windows8, 10, 11 x86_64
Installing QEMU:

```sh
brew install qemu
```

Optionally, install libvirt to get more flexibility:

```sh
brew install libvirt virt-manager

brew services start libvirt
```

For native speeds an ISO image for AARCH64 hosts (ARM) is needed. Of course, x86 ISO will also need QEMU to emulate the virtual hardware.

1. Using QEMU - qemu-system-aarch64 & qemu-system-x86_64
vm_start_fs37xfce.sh - Install & start Fedora37 aarch64 VM with GUI XFCE and network          
vm_start_rh87x86_64.sh - Install and start RHEL87 x86_64 VM with GUI and network


2. Using libvirt / virsh
libvirt_start.sh - Install & start Fedora37 aarch64 VM with GUI XFCE and network

Guest OS Windows x86_64 emulated via QEMU    


