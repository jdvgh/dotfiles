{
  config,
  pkgs,
  pkgsStable,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Basic
    mkpasswd

    gnutar
    unzip

    binutils
    coreutils-full
    findutils
    binutils
    moreutils

    hdparm
    exfatprogs
    zfs
    baobab # Analyze disks.

    dmidecode # BIOS read tool.
    lshw
    pciutils
    usbutils
    xorg.xev # For keyboard key press properties.
    xorg.xkbcomp # For checking xkb keyboard symbol tables.

    libGL
    libGLU

    mlocate
    ncurses5

    fd
    tree
    file
    fzf
    lsof

    wget
    curl

    neovim

    dmenu
    gnome.gnome-control-center
    gnome.gnome-tweaks


    btop
    dig
    dracula-theme
    font-manager
    gnome.gdm
    gnome.gnome-session
    gnome3.adwaita-icon-theme  # default gnome cursors
    gnumake
    grim # screenshot functionality
    hyprpaper
    gettext
    glib
    killall
    ripgrep
    yarn
    yarn2nix
    pavucontrol
    pinentry
    pinentry-curses
    slurp # screenshot functionality
    git-lfs
    power-profiles-daemon
    powertop
    htop
    wdisplays # tool to configure displays
    wget
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    xdg-utils # for opening default programs when clicking links
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland

    zsh
    tmux
    bash

    wofi
    zk

    gitFull
    lazygit
    # Virtualisation
    docker
    docker-compose
    krew
    kubecm
    kubectl
    k9s # Kubernetes management CLI tool
    kubernetes-helm

    # Other virtualisation stuff.
    # libguestfs # Needed to virt-sparsify qcow2 files
    # libvirt
    # spice # For automatic window resize if this conf is used as OS in VM
    # spice-vdagent
    # virt-manager
  ];
}
