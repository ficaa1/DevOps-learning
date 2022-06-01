resource "proxmox_vm_qemu" "your-vm" {
    
    # VM General Settings
    target_node = "labadmin1"
    name = "harvester-pxeboot"
    desc = "PXE boot Harvester"

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    clone = "harvester-pxeboot"  #Proxmox Template

    # VM Network Settings
    network {
        bridge = "vmbr2"
        model  = "virtio"
    }

    # VM Cloud-Init Settings
    os_type = "centos"

    # (Optional) IP Address and Gateway
    # ipconfig0 = "ip=0.0.0.0/0,gw=0.0.0.0"
    
    # (Optional) Default User
    # ciuser = "your-username"
    
    # (Optional) Add your SSH KEY
    # sshkeys = <<EOF
    # #YOUR-PUBLIC-SSH-KEY
    # EOF
}
