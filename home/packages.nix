{
  lib,
  pkgs,
  pkgsStable,
  ...
}:
# Define some special packages.
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with pkgs; [
    # Basics
    age # Encryption tool.
    git
    git-lfs
    tig
    xorg.libxcvt
    hyprpicker
    rofimoji
    rbw
    rofi-rbw
    fuzzel
    wtype
    hyprkeys
    hyprcursor

    zenity # For dialogs over githooks.
    graphviz

    seahorse

    alacritty
    neovim

    # Tools
    restic # Backup tool
    copyq
    lf # File manager
    chafa # For Sixel pictures in terminal
    exiftool # For image meta preview.
    atool # For archive preview
    bat # For text preview with syntax highlight and Git integration.
    poppler_utils # For image conversions.
    ffmpegthumbnailer # For video thumbnails.
    trash-cli
    gnome-disk-utility
    catppuccin-cursors.latteDark
    silver-searcher

    # Programming
    (lib.hiPrio parallel)
    sqlite
    bun
    delve
    earthly
    evans
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    protoc-gen-go-grpc
    protoc-gen-go
    hcloud
    chezmoi
    terraform
    packer
    luajit
    lazygit
    delta
    kubectl
    k9s # Kubernetes management CLI tool
    kdiff3
    jq
    yq-go
    yarn
    just
    shellharden
    corepack_20
    anki

    # Linters
    markdownlint-cli
    yamllint
    nodePackages.jsonlint
    codespell
    typos
    shfmt
    shellcheck

    ## Lsp
    # rust-analyzer and clangd come with
    # the toolchain.
    gopls
    golangci-lint-langserver
    texlab
    marksman
    lua-language-server
    luarocks
    yaml-language-server
    yamllint

    nodePackages.dockerfile-language-server-nodejs
    nodePackages.bash-language-server
    nodePackages.vscode-json-languageserver
    nodePackages.yaml-language-server

    ## Debug Adapters
    # lldb-code is installed in llvm
    delve

    ## C
    gnumake
    # gcc
    gdb
    # libclang
    autoconf
    libtool
    pkg-config

    # autoconf
    # libtool
    # pkgconf

    ## C++
    cmake
    # cppcheck
    # gcc13
    # gdb

    ## Buf
    buf
    ## Go
    go
    go-task
    goreman
    goreleaser
    golangci-lint
    gotools

    ## Node
    nodejs

    ## Java
    openjdk

    ## Rust
    rustup

    ## Python
    python311
    python311Packages.pip

    ## Nix
    nixpkgs-lint
    stdenv.cc
    alejandra
    nixfmt-rfc-style

    ## Lua
    stylua

    # Config Files
    nodePackages.prettier

    # Writing
    pandoc

    # MultiMedia
    bitwarden # Password manager
    bitwarden-cli
    signal-desktop # Messaging app
    transmission_4-gtk
    ffmpeg # Movie converter
    vlc # Movie player
    inkscape # Vector graphics
    krita # Painting
    nomacs # Image viewer
    zathura # Simple document viewer
    pdfarranger # PDF arranger
    ghostscript
    imagemagick_light # Converter tools
    ymuse # Sound player
    firefox
    spotify
    steam
    google-chrome
    openvpn

    # Dictionaries
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    hunspell
    hunspellDicts.en-us
  ];

  # # Install Neovim nightly if needed. Careful with Astrovim Setup.
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #   }))
  #   (self: super: {
  #    neovim = super.neovim.override {
  #      viAlias = true;
  #      vimAlias = true;
  #    };
  #  })
  # ];
}
