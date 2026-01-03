{ inputs, username, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${username}.imports = with inputs; [
      spicetify-nix.homeManagerModules.default
      zen-browser.homeModules.twilight
    ];
  };
}
