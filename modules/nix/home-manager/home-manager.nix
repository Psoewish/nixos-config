{ inputs, ... }: {
  flake-file.inputs.home-manager.url = "github:nix-community/home-manager";

  flake.modules.nixos.home-manager = {
    imports = [ (inputs.home-manager.nixosModules.home-manager or { }) ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupCommand = "rm";
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
