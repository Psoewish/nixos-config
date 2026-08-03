{
  flake.modules.nixos.psoewish = {
    config,
    pkgs,
    ...
  }: {
    users.groups.psoewish = {};
    users.users.psoewish = {
      isNormalUser = true;
      description = "${config.constants.primaryUser}";
      group = "psoewish";
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "render"
        "input"
        "uinput"
      ];
      shell = pkgs.fish;
    };
    programs.fish.enable = true;

    home-manager.users.${config.constants.primaryUser}.home = {
      username = "${config.constants.primaryUser}";
      homeDirectory = "/home/${config.constants.primaryUser}";
      stateVersion = "${config.constants.hosts.desktop.stateVersion}";
    };

    security.sudo.wheelNeedsPassword = false;
    nix.settings.trusted-users = [
      "root"
      "${config.constants.primaryUser}"
    ];
  };
}
