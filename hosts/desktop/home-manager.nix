{
  inputs,
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
    users.${username}.imports = with inputs; [
      noctalia.homeModules.default
    ];
  };
}
