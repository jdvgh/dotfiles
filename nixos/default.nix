{ inputs, outputs, ... }:
with inputs;
{
  # The NixOs running on lenovo laptop
  desktop = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./hosts/settings.nix
      ./hosts/desktop/configuration.nix
    ];
    specialArgs = {
      inherit inputs outputs;
    };
  };

  # The NixOs for the virtual machine.
  vm = nixpkgs.lib.nixosSystem {
    modules = [
      ./hosts/settings.nix
      ./hosts/vm/configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];
    specialArgs = {
      inherit inputs outputs;
    };
  };
  # The NixOs running on tower
  tower = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ./hosts/settings.nix
      ./hosts/tower/configuration.nix
    ];
    specialArgs = {
      inherit inputs outputs;
    };
  };
}
