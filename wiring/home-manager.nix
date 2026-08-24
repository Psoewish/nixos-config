{
  flake.modules.nixos.home-manager = {
    inputs,
    pkgs,
    ...
  }: {
    imports = [(inputs.home-manager.nixosModules.home-manager or {})];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupCommand = "${pkgs.trash-cli}/bin/trash";
      extraSpecialArgs = {inherit inputs;};
    };
  };
}
