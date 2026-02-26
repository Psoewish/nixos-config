{ username, ... }:
{
  home-manager.users.${username} =
    { osConfig, pkgs, ... }:
    {
      programs.lutris = {
        enable = true;
        steamPackage = osConfig.programs.steam.package;
        protonPackages = osConfig.programs.steam.extraCompatPackages;
        winePackages = [ pkgs.wineWow64Packages.full ];
        extraPackages = with pkgs; [
          mangohud
          winetricks
          gamescope
          gamemode
          umu-launcher
        ];
      };
    };
}
