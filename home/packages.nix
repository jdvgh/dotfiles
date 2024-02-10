{
  lib,
  pkgs,
  pkgsStable,
  inputs,
  ...
}: let
  # Define some special packages.

in {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  home.packages = with pkgs; [
    # Basics
    age # Encryption tool.
    git
    git-lfs
    tig

    gnome.zenity # For dialogs over githooks.

    gnome.seahorse

    alacritty
    neovim

    # Tools
    restic # Backup tool
    lf # File manager
    chafa # For Sixel pictures in terminal
    exiftool # For image meta preview.
    atool # For archive preview
    bat # For text preview with syntax highlight and Git integration.
    poppler_utils # For image conversions.
    ffmpegthumbnailer # For video thumbnails.
    trash-cli
    etcher
    gparted
    gnome.gnome-disk-utility

    # Programming
    (lib.hiPrio parallel)
    bun
    delve
    earthly
    evans
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    hcloud
    chezmoi
    terraform
    lazygit
    delta
    kubectl
    k9s # Kubernetes management CLI tool
    kdiff3
    jq
    yq-go
    yarn
    just

    # FHS Environment with nix-alien
    inputs.nixAlien.packages.${pkgs.system}.nix-alien

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
    rnix-lsp
    marksman
    lua-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.bash-language-server
    nodePackages.vscode-json-languageserver
    nodePackages.yaml-language-server

    ## Debug Adapters
    # lldb-code is installed in llvm
    delve

    ## C
    gnumake
    # autoconf
    # libtool
    # pkgconf

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
    nodePackages.pyright

    ## Nix
    nixpkgs-lint
    stdenv.cc
    alejandra
    nixfmt

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
    transmission-gtk
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
    google-chrome

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
