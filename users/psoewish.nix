{
  flake.modules.generic.psoewish = {pkgs, ...}: let
    username = "psoewish";
  in {
    users.groups.${username} = {};
    users.users.${username} = {
      group = "${username}";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "media"
      ];
      shell = pkgs.fish;
    };

    home-manager.users.${username} = {
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "26.05";
      };
    };
  };
}
