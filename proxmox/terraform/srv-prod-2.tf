resource "proxmox_vm_qemu" "srv_prod_2" {
  name        = "srv-prod-2"
  desc        = "Server Production 2, Main Database Server | Ubuntu Noble LTS"
  agent       = 1
  target_node = "pve-prod-1"
  tags        = "docker"

  vmid  = "101"
  clone = "ubuntu-noble-cloudinit-template"

  onboot           = true
  startup          = ""
  automatic_reboot = false

  cores   = 4
  sockets = 1
  cpu     = "host"
  memory  = 2048

  network {
    bridge = "vmbr0"
    model  = "virtio"
  }

  # disk {
  #   storage = "local-lvm"
  #   type    = "virtio"
  #   size    = "20G"
  # }

  scsihw = "virtio-scsi-pci"

  lifecycle {
    ignore_changes = [
      disk,
      vm_state
    ]
  }

  os_type    = "cloud-init"
  ipconfig0  = "ip=192.168.3.16/17,gw=192.168.1.0"
  nameserver = "192.168.3.0"
}
