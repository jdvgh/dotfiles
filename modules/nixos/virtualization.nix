{ config, pkgs, ... }:
{
  ### Virtualisation ==========================================================
  services.qemuGuest.enable = true;
  services.spice-vdagentd.enable = true;
  # boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.kernelModules = [ "kvm-amd" ];

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      ovmf.enable = true;
      runAsRoot = true;
    };
    onBoot = "ignore";
    onShutdown = "shutdown";
  };

  # Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = true;
  virtualisation.docker.daemon.settings = {
    bip = "192.168.1.5/24";
    fixed-cidr = "192.168.1.5/25";
    default-address-pools = [
      {
        base = "192.168.2.5/24";
        size = 28;
      }
      {
        base = "192.168.3.5/24";
        size = 28;
      }
      {
        base = "192.168.4.5/24";
        size = 28;
      }
      {
        base = "192.168.5.5/24";
        size = 28;
      }
      {
        base = "192.168.6.5/24";
        size = 28;
      }
      {
        base = "192.168.7.5/24";
        size = 28;
      }
    ];
  };

  # Virtualbox
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtensionPack = true;
  # ===========================================================================
}
