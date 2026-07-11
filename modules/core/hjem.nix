{ inputs, lib, ... }:
let
  inherit (lib) mkAliasOptionModule;
  username = "psoewish";
in
{
  imports = [
    (mkAliasOptionModule [ "hjem" "fractal" "home" ] [ "hjem" "users" username ])
    (mkAliasOptionModule [ "hjem" "fractal" "config" ] [ "hjem" "fractal" "home" "xdg" "config" ])
    (mkAliasOptionModule [ "hjem" "fractal" "data" ] [ "hjem" "fractal" "home" "xdg" "data" ])
    (mkAliasOptionModule [ "hjem" "fractal" "state" ] [ "hjem" "fractal" "home" "xdg" "state" ])
    (mkAliasOptionModule [ "hjem" "fractal" "cache" ] [ "hjem" "fractal" "home" "xdg" "cache" ])
    (mkAliasOptionModule [ "hjem" "fractal" "mime-apps" ] [ "hjem" "fractal" "home" "xdg" "mime-apps" ])
  ];

  hjem = {
    specialArgs = { inherit inputs; };
    clobberByDefault = true;
    users.${username} = {
      enable = true;
      directory = "/home/${username}";
    };
  };
}
