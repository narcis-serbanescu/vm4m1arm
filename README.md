# QEMU based Virtual Machines with GUI and Network running on MAC computers with Apple Silicon (M1 devices)         

## How to setup and run Linux VMs on Apple M1 host using QEMU, libvirt and HVF with GUI and network        

### Requirements

HOST
- MacOS - 12.6.1 Monterey
- Chip - M1 Pro
- QEMU - 7.2.0  
- libvirt - 8.9.0  
- virt-manager - 4.1.0  

Guest OS Fedora Linux


```sh
brew install qemu libvirt virt-manager

brew services start libvirt
```

1. Using QEMU - qemu-system-aarch64 & qemu-system-x86_64

2. Using libvirt / virsh



