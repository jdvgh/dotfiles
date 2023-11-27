# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).


{ config, lib, pkgs, ... }:
let
  gdk = pkgs.google-cloud-sdk.withExtraComponents( with pkgs.google-cloud-sdk.components; [
    gke-gcloud-auth-plugin
  ]);
    terraform160Tarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/6608f1624a8dd9d001de8fc24baa9a2d929b0e82.tar.gz;
    unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz;
    node2080Tarball = 
      fetchTarball
      https://github.com/NixOS/nixpkgs/archive/9957cd48326fe8dbd52fdc50dd2502307f188b0d.tar.gz;

 in
{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  "${builtins.fetchGit { url = "https://github.com/jdvgh/nixos-hardware.git"; ref = "feat/lenovo-legion-15-ach6";}}/lenovo/legion/16ach6h"
];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-99f1418e-d80c-4bc5-a9d3-3d04b545e0e4".device = "/dev/disk/by-uuid/99f1418e-d80c-4bc5-a9d3-3d04b545e0e4";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.defaultSession = "gnome";
  # Display Manager ===========================================================
##  services.xserver.displayManager = {
##    sddm.enable = false;
##    gdm = {
##      enable = true;
##      wayland = true;
##    };
##  };
services.pcscd.enable = true;

programs.gnupg = {
agent = {
enable = true;
enableSSHSupport = true;
};
};
##  # Sway Window Manager
##  environment.loginShellInit= ''
##	if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
##		sway --unsupported-gpu -V > .sway-log 2>&1
##	fi
##  '';
##
##  programs.sway = {
##    enable = true;
##    wrapperFeatures.gtk = true; # so that gtk works properly
##
##    extraPackages = with pkgs; [
##      power-profiles-daemon
##
##      redshift # Redshift monitor colors.
##      swaylock
##      swayidle
##      swaynotificationcenter
##      libnotify
##
##      xdg-utils
##      flashfocus # Flash focus animations in sway.
##      copyq # Clipboard manager.
##
##      wl-clipboard # Wayland clipboard.
##      wf-recorder # Wayland screen recorder.
##      grim # Screenshot tool in Wayland.
##      slurp # Wayland region selector.
##      sway-contrib.grimshot # Main screenshot tool.
##      swappy # Edit tool for screenshots.
##
##      rofi # Application Launcher for waybar.
##      rofi-power-menu
##      rofi-bluetooth
##      rofi-systemd
##      rofimoji
##      playerctl # Player control in waybar.
##    ];
##
##    extraSessionCommands = ''
##      export WLR_NO_HARDWARE_CURSORS=1
##      export MOZ_ENABLE_WAYLAND=1
##      export SDL_VIDEODRIVER=wayland
##      export QT_QPA_PLATFORM=wayland
##      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
##      export _JAVA_AWT_WM_NONREPARENTING=1
##    '';
##  };
##
##  security.polkit.enable = true; # https://discourse.nixos.org/t/sway-does-not-start/22354/5
##
##  programs.waybar.enable = true;
 fonts = {
   fontconfig.enable = true;
   fontDir.enable = true;

   fonts = with pkgs; [
     corefonts
     ubuntu_font_family
     fira
     meslo-lgs-nf
     (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono"];})
   ];
 };

  # Configure keymap in X11
  services.xserver = {
    layout = "eu";
    xkbVariant = "";
  };

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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
 virtualisation.docker.enable = true; 
  users.users.jonase = {
    isNormalUser = true;
    description = "j";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      alacritty
      lsof
      bitwarden
      chezmoi
      curl
      dmenu
      docker
      docker-compose
      firefox
      flameshot
      fzf
      gitFull
      gdk
      gnome.gnome-control-center
      gnome.gnome-tweaks
      unstable.go
      unstable.bun
      killall
      google-chrome
      go-task
      hcloud
      kubectl
      goreman
      krew
      kubecm
      k9s
      neovim
      pavucontrol
      ripgrep
      silver-searcher
      terraform
      nodejs208.nodejs_20
      nodejs208.yarn
      nodejs208.yarn2nix
      spotify
      discord
      # terraform160.terraform
      tmux
    #  thunderbird
    ];
  };
programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.packageOverrides = pkgs: {
       terraform160 = import terraform160Tarball {
        config = config.nixpkgs.config;
      };
     unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
      nodejs208 = import node2080Tarball {
        config = config.nixpkgs.config;
      };
    };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment.systemPackages = with pkgs; [
  qmk
 powertop
 power-profiles-daemon
  vscode

    unzip
    dig
    gnome.gnome-session
    gnome.gdm
    # wayland
    xdg-utils # for opening default programs when clicking links
    glib # gsettings
    dracula-theme # gtk theme
    gnome3.adwaita-icon-theme  # default gnome cursors
    # swaylock
    # swayidle
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    # bemenu # wayland clone of dmenu
    # mako # notification system developed by swaywm maintainer
    wdisplays # tool to configure displays
    font-manager
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    lshw
    pinentry-curses
    pinentry
    zsh
    # Programming - stolen from gabyx
    jq
    kubernetes-helm
    yq-go
    shfmt
    shellcheck
    llvmPackages_16.clang-unwrapped
    cmake
    gcc
    gdb
    gnumake
    go
    libclang
    libtool
    llvm
    openjdk
    rustup
    python311
    python311Packages.pip
    python311Packages.black
    nodePackages.pyright
    stylua
    nodePackages.prettier
    texlive.combined.scheme-full
    signal-desktop # Messaging app
    vlc # Movie player
    inkscape # Vector graphics
    krita # Painting
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}