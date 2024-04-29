{ config, pkgs, ... }:
{
  security = {
    rtkit.enable = true;

    apparmor = {
      enable = true;
      packages = with pkgs; [ apparmor-profiles ];
    };

    pam.services.login.enableGnomeKeyring = true;
    pam.services.swaylock = {};
  };

  services = {
    dbus.apparmor = "enabled";
    openssh = {
      settings = {
        PermitRootLogin = "no";
      };
    };
  };
}
