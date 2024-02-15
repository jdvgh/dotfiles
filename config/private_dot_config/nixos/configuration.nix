# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, lib, pkgs, ... }:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents( with pkgs.google-cloud-sdk.components; [
    gke-gcloud-auth-plugin
  ]);
    unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;

  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";

  hyprland-flake = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/Hyprland/archive/master.tar.gz";
  }).defaultNix;
  hyprland-contrib = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/hyprwm/contrib/archive/master.tar.gz";
  }).defaultNix;
  emanote-flake = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/srid/emanote/archive/master.tar.gz";
  }).defaultNix;
 in
{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  "${builtins.fetchGit { url = "https://github.com/jdvgh/nixos-hardware.git"; ref = "feat/lenovo-legion-15-ach6";}}/lenovo/legion/16ach6h"
];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-99f1418e-d80c-4bc5-a9d3-3d04b545e0e4".device = "/dev/disk/by-uuid/99f1418e-d80c-4bc5-a9d3-3d04b545e0e4";

  networking.hostName = "nixos"; # Define your hostname.


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver = 
  {
      enable = true;
  # Configure keymap in X11
    layout = "eu";
    xkbVariant = "";

  # Enable the GNOME Desktop Environment.
  displayManager.gdm.enable = true;
  displayManager.gdm.wayland = true;
  desktopManager.gnome.enable = true;
  displayManager.defaultSession = "gnome";
  };
services.pcscd.enable = true;
# hyprland
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
programs.waybar = {
      enable = true;
      # package = pkgs.waybar.overrideAttrs (oldAttrs: {
      #   mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      # });
    };
programs.hyprland = {
    enable = true;
     package = hyprland-flake.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
};
programs.gnupg = {
agent = {
enable = true;
enableSSHSupport = true;
};
};
 fonts = {
   fontconfig.enable = true;
   fontDir.enable = true;

   packages = with pkgs; [
     corefonts
     ubuntu_font_family
     fira
     meslo-lgs-nf
     (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
   ];
 };

# virtualisation:
virtualisation.libvirtd = {
    enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
}
programs.virt-manager.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
 virtualisation.docker.enable = true; 
  users.users.jonase = {
    isNormalUser = true;
    description = "j";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd"];
    packages = with pkgs; [
      unstable.alacritty
      bitwarden
      brave
      buf
      chezmoi
      curl
      dmenu
      docker
      docker-compose
      firefox
      fzf
      gdk
      gitFull
      gnome.gnome-control-center
      gnome.gnome-tweaks
      go-task
      google-chrome
      goreman
      hcloud
      unstable.k9s
      killall
      krew
      kubecm
      kubectl
      unstable.lazygit
      lsof
      neovim
      nodejs_20
      yarn
      yarn2nix
      pavucontrol
      ripgrep
      silver-searcher
      spotify
      terraform
      tmux
      unstable.bun
      unstable.discord
      unstable.flameshot
      unstable.go
      wofi
      zk
    ];
  };
programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.packageOverrides = pkgs: {
     unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
    unstable.cargo
    dig
    dracula-theme # gtk theme
    font-manager
    gcc
    gdb
    gettext
    git
    glib # gsettings
    gnome.gdm
    gnome.gnome-session
    gnome3.adwaita-icon-theme  # default gnome cursors
    gnumake
    go
    grim # screenshot functionality
    unstable.hyprpaper
    hyprland-contrib.packages.${pkgs.system}.grimblast
    emanote-flake.packages.${pkgs.system}.emanote
    unstable.hyprpicker
    inkscape # Vector graphics
    jq
    krita # Painting
    kubernetes-helm
    libclang
    libtool
    lshw
    nodePackages.prettier
    nodePackages.pyright
    openjdk
    pinentry
    pinentry-curses
    python311
    python311Packages.black
    python311Packages.pip
    unstable.rustup
    shellcheck
    shfmt
    signal-desktop # Messaging app
    slurp # screenshot functionality
    stylua
    unstable.swappy
    texlive.combined.scheme-full
    unzip
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vlc # Movie player
    wdisplays # tool to configure displays
    wget
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    xdg-utils # for opening default programs when clicking links
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    yq-go
    zsh
    git-lfs
    htop
    pgcli
    qmk
    unstable.delve
    unstable.earthly
    unstable.evans
    vscode
    power-profiles-daemon
    powertop
  ];
  # environment.sessionVariables = {
  #   LIBVA_DRIVER_NAME = "nvidia";
  #   XDG_SESSION_TYPE = "wayland";
  #   GBM_BACKEND = "nvidia-drm";
  #   __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  #   WLR_NO_HARDWARE_CURSORS = "1";
  #   NIXOS_OZONE_WL = "1";
  #   MOZ_ENABLE_WAYLAND = "1";
  #   SDL_VIDEODRIVER = "wayland";
  #   _JAVA_AWT_WM_NONREPARENTING = "1";
  #   CLUTTER_BACKEND = "wayland";
  #   WLR_RENDERER = "vulkan";
  #   XDG_CURRENT_DESKTOP = "Hyprland";
  #   XDG_SESSION_DESKTOP = "Hyprland";
  #   GTK_USE_PORTAL = "1";
  #   NIXOS_XDG_OPEN_USE_PORTAL = "1";
  # }; 
  system.stateVersion = "23.05"; # Did you read the comment?

}
