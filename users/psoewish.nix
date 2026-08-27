toplevel @ {config, ...}: {
  flake.modules.generic.${toplevel.config.flake.metadata.username} = {pkgs, ...}: {
    users.groups.${toplevel.config.flake.metadata.username} = {};
    users.users.${toplevel.config.flake.metadata.username} = {
      group = "${toplevel.config.flake.metadata.username}";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "media"
      ];
      shell = pkgs.fish;
    };
  };
}
