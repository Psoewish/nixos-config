{
  flake.modules.nixos.home-manager = {inputs, ...}: {
    imports = [(inputs.home-manager.nixosModules.home-manager or {})];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bak";
      overwriteBackup = true;
      extraSpecialArgs = {inherit inputs;};
    };
  };
}
