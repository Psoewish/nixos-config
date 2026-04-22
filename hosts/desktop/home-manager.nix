{
  pkgs,
  username,
  inputs,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs username; };
    backupCommand = "${pkgs.trash-cli}/bin/trash";
    users.${username} = {
      home = {
        username = username;
        homeDirectory = "/home/${username}";
        stateVersion = "25.11";
      };
      imports = with inputs; [
        catppuccin.homeModules.catppuccin
        zen-browser.homeModules.beta
      ];
    };
  };
}
