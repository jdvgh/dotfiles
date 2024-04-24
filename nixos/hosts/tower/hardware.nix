{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [
    # "intel"
    "amdgpu"
  ];
  #   services.xserver.monitorSection = ''
  # Modeline "3440x1440_60.00"  419.50  3440 3696 4064 4688  1440 1443 1453 1493 -hsync +vsync
  # Modeline "1904x1200_60.00"  191.00  1904 2032 2232 2560  1200 1203 1213 1245 -hsync +vsync
  # Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
  #   '';
  #   services.xserver.deviceSection = ''
  # Option "ModeValidation" "AllowNonEdidModes"
  # '';
  # Refer to https://nixos.wiki/wiki/Accelerated_Video_Playback
  # nixpkgs.config.packageOverrides = pkgs: {
  #   intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  # };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      # intel-media-driver # LIBVA_DRIVER_NAME=iHD
      # intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
      rocmPackages.clr.icd
      clinfo
      amdvlk
    ];
  };
  # environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Force intel-media-driver

  # environment.sessionVariables = {
  #   LIBVA_DRIVER_NAME = "i915";
  # }; # Force intel-vaapi-driver
  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
  };
  systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];

  #services.blueman.enable = true;
}
