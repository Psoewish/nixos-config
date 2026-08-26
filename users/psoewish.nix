{
  flake.modules.generic.psoewish = {pkgs, ...}: {
    users.groups.psoewish = {};
    users.users.psoewish = {
      group = "psoewish";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "media"
      ];
      shell = pkgs.fish;
    };

    home-manager.users.psoewish = {
      home = {
        username = "psoewish";
        homeDirectory = "/home/psoewish";
        stateVersion = "26.05";
      };
    };
  };
}
