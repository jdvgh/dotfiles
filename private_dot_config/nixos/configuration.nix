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
services.pcscd.enable = true;

programs.gnupg = {
agent = {
enable = true;
enableSSHSupport = true;
};
};
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
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
 virtualisation.docker.enable = true; 
  users.users.jonase = {
    isNormalUser = true;
    description = "j";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    packages = with pkgs; [
      alacritty
      bitwarden
      chezmoi
      curl
      discord
      dmenu
      docker
      docker-compose
      firefox
      flameshot
      fzf
      gdk
      gitFull
      gnome.gnome-control-center
      gnome.gnome-tweaks
      go-task
      google-chrome
      goreman
      hcloud
      k9s
      killall
      krew
      kubecm
      kubectl
      lsof
      neovim
      nodejs208.nodejs_20
      nodejs208.yarn
      nodejs208.yarn2nix
      pavucontrol
      ripgrep
      silver-searcher
      spotify
      terraform
      tmux
      unstable.bun
      unstable.go
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
    cmake
    dig
    dracula-theme # gtk theme
    font-manager
    gcc
    gdb
    git
    glib # gsettings
    gnome.gdm
    gnome.gnome-session
    gnome3.adwaita-icon-theme  # default gnome cursors
    gnumake
    go
    grim # screenshot functionality
    inkscape # Vector graphics
    jq
    krita # Painting
    kubernetes-helm
    libclang
    libtool
    llvm
    llvmPackages_16.clang-unwrapped
    lshw
    nodePackages.prettier
    nodePackages.pyright
    openjdk
    pinentry
    pinentry-curses
    python311
    python311Packages.black
    python311Packages.pip
    rustup
    shellcheck
    shfmt
    signal-desktop # Messaging app
    slurp # screenshot functionality
    stylua
    texlive.combined.scheme-full
    unzip
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vlc # Movie player
    wdisplays # tool to configure displays
    wget
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    xdg-utils # for opening default programs when clicking links
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

  system.stateVersion = "23.05"; # Did you read the comment?

}
