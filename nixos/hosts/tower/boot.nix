{ config, pkgs, ... }:
{
  boot = {
    loader = {
      grub.enable = true;
      grub.device = "/dev/sdb";
      #grub.device = "/dev/disks/by-id/ata-INTENSO_2FA6079417F500165904";
      grub.useOSProber = true;
      #systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
}
