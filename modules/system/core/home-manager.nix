{
  flake.modules.nixos.core = {
    inputs,
    lib,
    pkgs,
    ...
  }: {
    imports = [(inputs.home-manager.nixosModules.home-manager or {})];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupCommand = "${lib.getExe pkgs.trash-cli}";
      extraSpecialArgs = {inherit inputs;};
      sharedModules = [inputs.self.modules.homeManager.core];
    };
  };
}
