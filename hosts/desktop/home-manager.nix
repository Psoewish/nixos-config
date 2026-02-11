{
  inputs,
  lib,
  pkgs,
  username,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    backupCommand = "${pkgs.trash-cli}/bin/trash";
    users.${username}.imports =
      (inputs.import-tree.filter (lib.hasSuffix "default.nix") ../../modules/desktop/home).imports;
  };
}
