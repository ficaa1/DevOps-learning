terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "2.9.3"
        }
    }
}

variable "proxmox_api_url" {
    type = string
}

provider "proxmox" {

    pm_api_url = var.proxmox_api_url

    # (Optional) Skip TLS Verification
    # pm_tls_insecure = true

}
