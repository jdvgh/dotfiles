{ config, pkgs, ... }:
{
  boot = {
    loader = {
      grub.enable = true;
      # grub.device = "nodev";
      grub.device = "/dev/disk/by-id/ata-INTENSO_2FA6079417F500165904";
      # grub.useOSProber = true;
      # grub.efiSupport = true;
      #systemd-boot.enable = true;
      # efi = {
      #   canTouchEfiVariables = true;
      # };
    };
  };
}
