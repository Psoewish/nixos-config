{
  den.aspects.common.home-manager.nixos = {pkgs, ...}: {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupCommand = "${pkgs.trash-cli}/bin/trash";
    };
  };
}
