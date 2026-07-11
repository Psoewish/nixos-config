{
  pkgs,
  inputs,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupCommand = "${pkgs.trash-cli}/bin/trash";
    users."psoewish" = {
      home = {
        username = "psoewish";
        homeDirectory = "/home/psoewish";
        stateVersion = "25.11";
      };
      imports = with inputs; [
        catppuccin.homeModules.catppuccin
        zen-browser.homeModules.beta
      ];
    };
  };
}
