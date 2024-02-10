{
  config,
  pkgs,
  ...
}: {
  boot = {
    # Your `hardware-configuration.nix` should configure the LUKS device setup.
    # It should not be included here.
    # Bootloader ================================================================
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
      };
    };
  initrd.luks.devices."luks-99f1418e-d80c-4bc5-a9d3-3d04b545e0e4".device = "/dev/disk/by-uuid/99f1418e-d80c-4bc5-a9d3-3d04b545e0e4";
  };
}
