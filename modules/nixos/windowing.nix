{
  inputs,
  config,
  pkgs,
  pkgsStable,
  ...
}: {
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.xkb.layout = "eu";
  services.xserver.xkb.variant = "";
  services.xserver.autorun = true;

  # Display Manager ===========================================================
  services.xserver.displayManager = {
    sddm.enable = false;
    gdm = {
      enable = true;
      wayland = true;
    };
    autoLogin.enable = true;
    autoLogin.user = "nixos";
    defaultSession = "gnome";
  };
  services.xserver.desktopManager = {
    gnome.enable = true;
  };
  # ===========================================================================


  # Hyprland Window Manager ===================================================
    programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${pkgs.system}.hyprland;
        xwayland.enable = true; # Bridge to Wayland API for X11 apps.
    };
  # # Sessions variables
  # environment.sessionVariables = {
  #   # Clutter based apps.
  #   CLUTTER_BACKEND = "wayland";
  #   # Hint electron apps to use wayland.
  #   NIXOS_OZONE_WL = "1";
  #
  #   WLR_NO_HARDWARE_CURSORS = "1";
  #   WLR_RENDERER_ALLOW_SOFTWARE = "1";
  #   # WLR_RENDERER = "vulkan";
  #
  #   # XDG_CURRENT_DESKTOP = "Hyprland";
  #   # XDG_SESSION_DESKTOP = "Hyprland";
  #   XDG_SESSION_TYPE = "wayland";
  # };
  # ===========================================================================

  # security.polkit.enable = true; # https://discourse.nixos.org/t/sway-does-not-start/22354/5
  #
  programs.waybar.enable = true;

  fonts.packages = with pkgs; [
    # Waybar
    font-awesome
    cantarell-fonts
    noto-fonts
    noto-fonts-emoji
    (nerdfonts.override {fonts = ["Noto" "JetBrainsMono"];})
  ];
}
