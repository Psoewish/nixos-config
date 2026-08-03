{
  flake-file.inputs = {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.core = {inputs, ...}: {
    imports = [(inputs.home-manager.nixosModules.home-manager or {})];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupCommand = "rm";
      extraSpecialArgs = {inherit inputs;};
      sharedModules = [inputs.self.modules.homeManager.core];
    };
  };
}
