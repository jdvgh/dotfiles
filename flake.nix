{
  description = "My NixOS Configurations";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org/"
    ];
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgsStable.url = "github:nixos/nixpkgs/nixos-23.11";
    # Also see the 'stable-packages' overlay at 'overlays/default.nix'.

    # Index the nix-store.
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Some custom hardware modules.
    hardwarejdvgh = {
      url = "github:jdvgh/nixos-hardware/feat/lenovo-legion-15-ach6";
    };
    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix-Alien
    nixAlien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    hyprland,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;

    # Supported systems for your flake packages, shell, etc.
    systems = [
      "x86_64-linux"
    ];
    # This is a function that generates an attribute by calling a function you
    # pass to it, with each system as an argument
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    # Formatter for your nix files, available through 'nix fmt'
    # Other options beside 'alejandra' include 'nixpkgs-fmt'
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    # Reusable nixos modules you might want to export
    # These are usually stuff you would upstream into nixpkgs
    nixosModules = import ./modules/nixos;

    # Reusable home-manager modules you might want to export
    # These are usually stuff you would upstream into home-manager
    homeManagerModules = import ./modules/home;

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations =
      import ./nixos {inherit inputs outputs;};

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    # homeConfigurations = {
    #   # FIXME replace with your username@hostname
    #   "your-username@your-hostname" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
    #     extraSpecialArgs = {inherit inputs outputs;};
    #     modules = [
    #       # > Our main home-manager configuration file <
    #       ./home-manager/home.nix
    #     ];
    #   };
    # };
  };
}
