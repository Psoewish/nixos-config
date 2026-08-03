{
  flake-file.inputs = {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.home-manager = { inputs, ... }: {
    imports = [
      (inputs.home-manager.nixosModules.home-manager or { })
      # (inputs.home-manager.flakeModules.home-manager or { })
    ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupCommand = "rm";
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
