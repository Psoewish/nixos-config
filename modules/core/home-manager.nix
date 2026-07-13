{
  pkgs,
  lib,
  inputs,
  ...
}:
let
  inherit (lib) mkAliasOptionModule;
  username = "psoewish";
in
{
  imports = [ (mkAliasOptionModule [ "hm" ] [ "home-manager" "users" username ]) ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupCommand = "${pkgs.trash-cli}/bin/trash";
    users."psoewish".home = {
      username = "psoewish";
      homeDirectory = "/home/psoewish";
      stateVersion = "25.11";
    };
  };
}
