{ username, ... }:
{
  home-manager.users.${username} =
    { osConfig, pkgs, ... }:
    {
      programs.lutris = {
        enable = true;
        steamPackage = osConfig.programs.steam.package;
        protonPackages = osConfig.programs.steam.extraCompatPackages;
        extraPackages = with pkgs; [ umu-launcher ];
      };
    };
}
