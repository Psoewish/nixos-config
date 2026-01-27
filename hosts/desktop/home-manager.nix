{ inputs, username, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${username}.imports = with inputs; [
      zen-browser.homeModules.twilight
    ];
  };
}
